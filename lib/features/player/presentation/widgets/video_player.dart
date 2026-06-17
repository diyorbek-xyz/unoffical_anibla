import 'package:application/core/config/theme/app_theme.dart';
import 'dart:async';
import 'dart:io';
import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/features/common/presentation/widgets/responsive.dart';
import 'package:application/features/player/presentation/cubit/player_controller.dart';
import 'package:application/features/player/presentation/cubit/player_states.dart';
import 'package:application/features/player/presentation/widgets/episodes_drawer.dart';
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
    return BlocSelector<PlayerController, PlayerStates, (bool, String?, BoxFit)>(
      selector: (state) => (state.hasError, state.error, state.fit),
      builder: (context, state) {
        final (hasError, error, fit) = state;
        if (hasError && error == "empty") return Center(child: Text("Nimadur xato ketti"));
        if (hasError && error == "paid") return Center(child: Text("Bu animeni ko'rish uchun obuna sotib oling"));
        return Video(fit: fit, controller: controller.controller, controls: (_) => controlsBuilder);
      },
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
    buildWhen: (previous, current) => previous.hasError != current.hasError || previous.error != current.error,
    builder: (context, state) {
      final responsive = Responsive.of(context);
      return GestureDetector(
        onTap: () => controller.togglePlay(),
        behavior: responsive.isMobile ? HitTestBehavior.translucent : HitTestBehavior.opaque,
        child: Focus(
          autofocus: true,
          child: Stack(
            alignment: AlignmentGeometry.center,
            fit: StackFit.expand,
            children: [
              if (state.hasError && state.error != "empty")
                Container(color: context.appColors.surface, alignment: .center, child: Text(state.error!)),
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
                    appBar: AppBar(
                      backgroundColor: Colors.transparent,
                      automaticallyImplyLeading: false,
                      automaticallyImplyActions: false,
                      titleSpacing: 0,
                      toolbarHeight: kToolbarHeight + 30,
                      actionsPadding: EdgeInsets.only(top: 30, right: 30),
                      title: BlocSelector<PlayerController, PlayerStates, String>(
                        selector: (state) => state.anime,
                        builder: (context, state) => Padding(
                          padding: .only(top: 30, left: 30),
                          child: widget.isPage
                              ? Row(
                                  crossAxisAlignment: .center,
                                  spacing: 20,
                                  children: [
                                    IconButton(onPressed: () => context.pop(), icon: Icon(Icons.keyboard_arrow_left)),
                                    Text(state),
                                  ],
                                )
                              : Text(state),
                        ),
                      ),
                      actions: [topControls],
                    ),
                    extendBody: true,
                    extendBodyBehindAppBar: true,
                    body: Center(child: overlayControls),
                    bottomNavigationBar: bottomControls,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
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

  Widget get topControls => BlocSelector<PlayerController, PlayerStates, bool>(
    selector: (state) => state.isFullscreen,
    builder: (context, isFullscreen) {
      return Row(
        crossAxisAlignment: .center,
        spacing: 7,
        children: [
          IconButton(onPressed: Scaffold.of(context).openEndDrawer, iconSize: 25, padding: EdgeInsets.zero, icon: Icon(Icons.list_sharp)),
          IconButton(onPressed: controller.toggleFit, iconSize: 25, padding: EdgeInsets.zero, icon: Icon(Icons.fit_screen_sharp)),
          IconButton(onPressed: openSettings, iconSize: 25, padding: EdgeInsets.zero, icon: Icon(Icons.settings_sharp)),
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

  Widget get overlayControls => BlocSelector<PlayerController, PlayerStates, (PlaylistPosition, bool, bool)>(
    selector: (state) => (state.position, state.isPaused, state.isBuffering),
    builder: (local, state) {
      final (position, isPaused, isBuffering) = state;
      final hasNext = (position == .first || position == .middle);
      final hasPrev = (position == .last || position == .middle);
      return Row(
        crossAxisAlignment: .center,
        mainAxisAlignment: .center,
        spacing: 20,
        children: [
          Opacity(
            opacity: hasPrev ? 1 : 0,
            child: IconButton(
              onPressed: hasPrev ? () {} : null,
              mouseCursor: hasPrev ? SystemMouseCursors.click : .defer,
              padding: EdgeInsets.all(10),
              iconSize: 40,
              icon: Icon(Icons.skip_previous),
            ),
          ),
          Stack(
            alignment: .center,
            fit: .passthrough,
            children: [
              Opacity(
                opacity: isBuffering ? 1 : 0,
                child: CircularProgressIndicator.adaptive(
                  strokeWidth: 7,
                  constraints: BoxConstraints.tightFor(width: 100, height: 100),
                  strokeCap: StrokeCap.round,
                  valueColor: AlwaysStoppedAnimation(context.appColors.primary),
                ),
              ),
              IconButton(
                onPressed: controller.togglePlay,
                padding: EdgeInsets.all(10),
                iconSize: 50,
                isSelected: isPaused,
                selectedIcon: Icon(Icons.play_arrow),
                icon: Icon(Icons.pause),
              ),
            ],
          ),
          Opacity(
            opacity: hasNext ? 1 : 0,
            child: IconButton(
              onPressed: hasNext ? () {} : null,
              mouseCursor: hasNext ? SystemMouseCursors.click : .defer,
              padding: EdgeInsets.all(10),
              iconSize: 40,
              icon: Icon(Icons.skip_next),
            ),
          ),
        ],
      );
    },
  );

  Widget get bottomControls => BlocSelector<PlayerController, PlayerStates, (bool, String?)>(
    selector: (state) => (state.hasError, state.error),
    builder: (_, stat) {
      final (hasError, error) = stat;
      if (hasError && error == "empty") return SizedBox.shrink();
      return Container(
        padding: EdgeInsets.only(bottom: 50, left: 30, right: 30),
        child: MouseRegion(
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
                bufferedBarColor: context.appColors.primaryFixed.withAlpha(100),
                barHeight: 5,
                baseBarColor: context.appColors.onPrimary.withAlpha(100),
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
      constraints: const BoxConstraints.tightFor(width: 400, height: 300),
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
