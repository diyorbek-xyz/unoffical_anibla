import 'dart:ui';

import 'package:application/core/config/theme/app_theme.dart';
import 'dart:async';
import 'dart:io';
import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/features/animes/data/models/anime_model.dart';
import 'package:application/features/common/presentation/widgets/responsive.dart';
import 'package:application/features/player/presentation/cubit/player/player_controller.dart';
import 'package:application/features/player/presentation/cubit/player/player_states.dart';
import 'package:application/features/player/presentation/widgets/episodes_drawer.dart';
import 'package:application/features/player/presentation/widgets/player_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:media_kit_video/media_kit_video.dart';

class VideoPlayer extends StatefulWidget {
  final bool isFullscreen;
  final bool isPage;
  const VideoPlayer({super.key, this.isFullscreen = false, this.isPage = false});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  final isMobilePlatform = Platform.isAndroid || Platform.isIOS;
  late PlayerController controller;

  @override
  void initState() {
    controller = context.read<PlayerController>();
    autoHideControls();
    super.initState();
  }

  @override
  void deactivate() {
    if (!controller.isClosed && !widget.isFullscreen) controller.pause();
    super.deactivate();
  }

  int forwardSkipSteps = 0;
  int backwardSkipSteps = 0;
  Timer? _debounce;

  Timer? _autoHideTimer;

  bool isControlsVisible = true;

  void toggleControls() => autoHideControls(!isControlsVisible);

  void hideControls() {
    _autoHideTimer?.cancel();
    if (!isControlsVisible || !mounted) return;
    setState(() => isControlsVisible = false);
  }

  void autoHideControls([bool? value]) {
    final visible = value ?? true;
    _autoHideTimer?.cancel();
    if (isControlsVisible != visible && mounted) setState(() => isControlsVisible = visible);
    _autoHideTimer = Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      final state = controller.state;
      if (state.isPaused || state.isBuffering || !isControlsVisible) return;
      setState(() => isControlsVisible = false);
    });
  }

  void skip(int step) async {
    if (!mounted) return;
    setState(() {
      if (step < 0) {
        backwardSkipSteps += step;
      } else {
        forwardSkipSteps += step;
      }
    });
    await controller.skip(Duration(seconds: step));

    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(
      const Duration(seconds: 2),
      () => setState(() {
        backwardSkipSteps = 0;
        forwardSkipSteps = 0;
      }),
    );
  }

  void openSettings() => showDialog(context: context, builder: settingsDialog);

  KeyEventResult onKey(FocusNode node, KeyEvent event, Duration position, Duration duration) {
    // Down + Repeat -> tugma bosib turilganda ham seek davom etadi
    final step = Duration(seconds: 5);
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }

    if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
      final p = position - step;
      controller.seek(p < Duration.zero ? Duration.zero : p);
      return KeyEventResult.handled;
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
      final p = position + step;
      controller.seek(p > duration ? duration : p);
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PlayerController, PlayerStates, BoxFit>(
      selector: (state) => state.fit,
      builder: (context, state) => Video(fit: state, controller: controller.controller, controls: (_) => controlsBuilder),
    );
  }

  ThemeData themeData(BuildContext context) => AppThemes.darkTheme.copyWith(
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: .circular(10)))),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        mouseCursor: WidgetStatePropertyAll(SystemMouseCursors.click),
        iconColor: WidgetStatePropertyAll(Colors.white),
        shape: WidgetStateProperty.fromMap({WidgetState.focused: RoundedRectangleBorder(borderRadius: .circular(10))}),
        backgroundColor: WidgetStateProperty.fromMap({
          WidgetState.focused: context.appColors.primary.withAlpha(150),
          WidgetState.any: context.appColors.primaryContainer.withAlpha(150),
        }),
        foregroundColor: WidgetStatePropertyAll(context.appColors.primary),
      ),
    ),
  );

  Widget get controlsBuilder => Theme(
    data: themeData(context),
    child: CallbackShortcuts(
      bindings: keyBindings,
      child: Material(
        type: MaterialType.transparency,
        child: LayoutBuilder(
          builder: (_, constraints) {
            final main = Responsive(constraints: constraints, child: controls);

            if (main.isMobile) {
              return GestureDetector(excludeFromSemantics: true, behavior: HitTestBehavior.opaque, onTap: toggleControls, child: main);
            }
            return MouseRegion(
              cursor: isControlsVisible ? MouseCursor.defer : SystemMouseCursors.none,
              onExit: (event) => hideControls(),
              onHover: (event) => autoHideControls(),
              onEnter: (event) => autoHideControls(),
              child: Listener(
                onPointerMove: (event) => autoHideControls(),
                onPointerDown: (event) => autoHideControls(),
                onPointerUp: (event) => autoHideControls(),
                child: main,
              ),
            );
          },
        ),
      ),
    ),
  );

  Widget get controls => BlocBuilder<PlayerController, PlayerStates>(
    buildWhen: (previous, current) => previous.status != current.status,
    builder: (context, state) {
      final responsive = Responsive.of(context);
      return GestureDetector(
        onTap: responsive.isMobile ? null : controller.togglePlay,
        behavior: responsive.isMobile ? HitTestBehavior.translucent : HitTestBehavior.opaque,
        child: Focus(
          autofocus: true,
          child: BlocSelector<PlayerController, PlayerStates, (PlayerStatus, String)>(
            selector: (state) => (state.status, state.message),
            builder: (context, state) {
              final (status, error) = state;
              return Stack(
                alignment: AlignmentGeometry.center,
                fit: StackFit.expand,
                children: [
                  if (status == .error) errorBuilder(context, status, error),
                  skippers,
                  AnimatedOpacity(
                    opacity: isControlsVisible ? 1 : 0,
                    duration: Duration(milliseconds: 200),
                    child: IgnorePointer(
                      ignoring: !isControlsVisible,
                      child: Scaffold(
                        backgroundColor: Colors.transparent,
                        endDrawer: episodesDrawer,
                        endDrawerEnableOpenDragGesture: true,
                        appBar: appBar(responsive),
                        extendBody: true,
                        extendBodyBehindAppBar: true,
                        bottomNavigationBar: bottomControls,
                        body: PlayerOverlayControls(controller: controller, bufferingIndicator: bufferingIndicator),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      );
    },
  );

  AppBar appBar(Responsive responsive) => AppBar(
    backgroundColor: Colors.transparent,
    automaticallyImplyLeading: false,
    automaticallyImplyActions: false,
    titleSpacing: 0,
    toolbarHeight: kToolbarHeight + 30,
    actionsPadding: EdgeInsets.only(top: 30, right: 30),
    title: BlocSelector<PlayerController, PlayerStates, String>(
      selector: (state) => state.stream.anime,
      builder: (context, state) => Padding(
        padding: .only(top: 30, left: 30),
        child: widget.isPage
            ? responsive.isMobileWidth
                  ? IconButton(onPressed: context.pop, icon: Icon(Icons.keyboard_arrow_left))
                  : Row(
                      crossAxisAlignment: .center,
                      mainAxisAlignment: .start,
                      spacing: 20,
                      children: [
                        IconButton(onPressed: context.pop, icon: Icon(Icons.keyboard_arrow_left)),
                        Expanded(child: Text(state)),
                      ],
                    )
            : Text(state),
      ),
    ),
    actions: [topControls],
  );

  Container errorBuilder(BuildContext context, PlayerStatus status, String error) => Container(
    color: context.appColors.surface.withAlpha(100),
    alignment: .center,
    child: Container(
      width: 400,
      height: 200,
      alignment: .bottomCenter,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Text(status == .paid ? "Bu animeni ko'rish uchun obuna sotib oling" : error, textAlign: .center),
      ),
    ),
  );

  Widget get skippers {
    Widget skipper(int step, bool isMobile) {
      final skipping = (step < 0 && backwardSkipSteps != 0) || (step > 0 && forwardSkipSteps != 0);
      final child = AnimatedOpacity(
        duration: Duration(milliseconds: skipping ? 200 : 0),
        opacity: skipping ? 1 : 0,
        child: Align(
          alignment: AlignmentGeometry.center,
          child: Text(step < 0 ? "$backwardSkipSteps" : "+$forwardSkipSteps", style: TextStyle(color: Colors.white, fontSize: 50)),
        ),
      );
      if (!isMobile) return child;
      return GestureDetector(behavior: HitTestBehavior.translucent, onDoubleTap: () => skip(step), onTap: toggleControls, child: child);
    }

    return Builder(
      builder: (local) {
        final responsive = Responsive.of(local);
        return Row(
          mainAxisAlignment: .spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: skipper(-5, responsive.isMobile)),
            Expanded(child: skipper(5, responsive.isMobile)),
          ],
        );
      },
    );
  }

  Widget get topControls => BlocSelector<PlayerController, PlayerStates, (bool, AnimeType)>(
    selector: (state) => (state.isFullscreen, state.type),
    builder: (context, state) {
      final (isFullscreen, type) = state;
      final isMobile = Responsive.of(context).isMobileWidth;

      return Row(
        crossAxisAlignment: .center,
        spacing: 7,
        mainAxisAlignment: isMobile ? .end : .start,
        children: [
          IconButton(onPressed: Scaffold.of(context).openEndDrawer, iconSize: 25, padding: EdgeInsets.zero, icon: Icon(Icons.list_sharp)),
          IconButton(onPressed: controller.toggleFit, iconSize: 25, padding: EdgeInsets.zero, icon: Icon(Icons.fit_screen_sharp)),
          IconButton(onPressed: openSettings, iconSize: 25, padding: EdgeInsets.zero, icon: Icon(Icons.settings_sharp)),
          if (type.isSerie)
            IconButton(
              onPressed: () => controller.toggleFullscreen(context),
              iconSize: 25,
              padding: EdgeInsets.zero,
              icon: Icon(isFullscreen ? Icons.fullscreen_exit_sharp : Icons.fullscreen_sharp),
            ),
        ],
      );
    },
  );

  Widget get bufferingIndicator => BlocSelector<PlayerController, PlayerStates, bool>(
    selector: (state) => state.isBuffering,
    builder: (context, state) => IgnorePointer(
      ignoring: true,
      child: Opacity(
        opacity: state ? 1 : 0,
        child: CircularProgressIndicator.adaptive(
          strokeWidth: 7,
          constraints: BoxConstraints.tightFor(width: 100, height: 100),
          strokeCap: StrokeCap.round,
          valueColor: AlwaysStoppedAnimation(context.appColors.primary),
        ),
      ),
    ),
  );

  Widget get bottomControls => BlocSelector<PlayerController, PlayerStates, (PlayerStatus, String)>(
    selector: (state) => (state.status, state.message),
    builder: (context, state) {
      final (status, error) = state;
      if (status == .empty) return SizedBox.shrink();
      final isMobile = Responsive.of(context).isMobileWidth;
      return Container(
        constraints: BoxConstraints.tightFor(height: 200),
        padding: EdgeInsets.only(bottom: isMobile ? 30 : 50, left: isMobile ? 10 : 30, right: isMobile ? 10 : 30),
        child: Column(
          mainAxisAlignment: .end,
          spacing: 30,
          crossAxisAlignment: .start,
          children: [
            isMobile
                ? BlocSelector<PlayerController, PlayerStates, CurrentStream>(
                    selector: (state) => state.stream,
                    builder: (context, state) => Text("${state.offset}-qism ~ ${state.title}", style: context.textTheme.titleMedium),
                  )
                : Row(
                    crossAxisAlignment: .end,
                    children: [
                      Expanded(
                        child: BlocSelector<PlayerController, PlayerStates, CurrentStream>(
                          selector: (state) => state.stream,
                          builder: (context, state) => Text("${state.offset}-qism ~ ${state.title}", style: context.textTheme.titleMedium),
                        ),
                      ),
                      Center(
                        child: PlayerOverlayControls(controller: controller, bufferingIndicator: bufferingIndicator, atOverlay: false),
                      ),
                      Expanded(child: SizedBox.shrink()),
                    ],
                  ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: BlocSelector<PlayerController, PlayerStates, (Duration, Duration, Duration)>(
                selector: (state) => (state.progress, state.buffer, state.duration),
                builder: (_, progress) => Focus(
                  canRequestFocus: true,
                  onKeyEvent: (node, event) => onKey(node, event, progress.$1, progress.$3),
                  autofocus: true,
                  child: ProgressBar(
                    progress: progress.$1,
                    buffered: progress.$2,
                    total: progress.$3,
                    progressBarColor: context.appColors.primary,
                    bufferedBarColor: context.appColors.primaryFixed.withAlpha(150),
                    barHeight: 5,
                    baseBarColor: context.appColors.primaryFixed.withAlpha(60),
                    barCapShape: BarCapShape.round,
                    thumbRadius: 7,
                    thumbColor: context.appColors.primaryFixed,
                    thumbGlowRadius: 13,
                    thumbGlowColor: context.appColors.primaryFixedDim.withAlpha(100),
                    timeLabelPadding: 10,
                    timeLabelTextStyle: TextStyle(color: context.appColors.primary, fontWeight: FontWeight.bold, fontSize: 14),
                    timeLabelLocation: TimeLabelLocation.sides,
                    onSeek: (value) => controller.seek(value),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );

  Map<ShortcutActivator, VoidCallback> get keyBindings => {
    const SingleActivator(LogicalKeyboardKey.keyF): () => controller.toggleFullscreen(context),
    const SingleActivator(LogicalKeyboardKey.space, includeRepeats: false): () {
      autoHideControls();
      controller.togglePlay();
    },
    const SingleActivator(LogicalKeyboardKey.arrowLeft): () => skip(-5),
    const SingleActivator(LogicalKeyboardKey.arrowRight): () => skip(5),
    const SingleActivator(LogicalKeyboardKey.arrowUp): controller.upVolume,
    const SingleActivator(LogicalKeyboardKey.arrowDown): controller.downVolume,
    const SingleActivator(LogicalKeyboardKey.enter): () {
      if (controller.state.hasIntro) controller.skipIntro();
    },
  };

  Widget get episodesDrawer => Drawer(width: 600, shape: Border(), child: EpisodesDrawer());

  Widget settingsDialog(BuildContext dialogcontext) {
    final state = controller.state;
    final tracks = state.tracks.video.where((element) => element.toString().contains("auto") || element.h != null).toList();
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(20)),
      constraints: const BoxConstraints.tightFor(width: 400, height: 400),
      title: Row(
        crossAxisAlignment: .center,
        mainAxisAlignment: .spaceBetween,
        children: [
          Text("Video sifati"),
          IconButton(onPressed: () => Navigator.pop(dialogcontext), icon: Icon(Icons.close)),
        ],
      ),
      content: ListView.builder(
        itemCount: tracks.length,
        itemBuilder: (context, index) {
          final track = tracks.elementAt(index);
          final isCurrent = track.id == state.videoTrack.id;
          final title = track.h?.toString() ?? track.w?.toString() ?? track.id;
          final isId = title == track.id;
          return ListTile(
            leading: Icon(isCurrent ? Icons.check : Icons.hd),
            onTap: () {
              Navigator.pop(dialogcontext);
              controller.setResolution(track);
            },
            title: Text(!isId ? "${title}p" : title),
          );
        },
      ),
    );
  }
}
