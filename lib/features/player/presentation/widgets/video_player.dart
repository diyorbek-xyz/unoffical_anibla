import 'dart:ui';

import 'package:application/core/config/theme/app_theme.dart';
import 'dart:async';
import 'dart:io';
import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/features/player/presentation/controller/player_controller.dart';
import 'package:application/features/player/presentation/widgets/player_scope.dart';
import 'package:application/injection_container.dart';
import 'package:application/shared/widgets/responsive.dart';
import 'package:application/features/player/presentation/widgets/episodes_drawer.dart';
import 'package:application/features/player/presentation/widgets/player_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:signals_flutter/signals_flutter.dart';

class VideoPlayer extends StatefulWidget {
  final bool isPage;
  const VideoPlayer({super.key, this.isPage = false});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  final isMobilePlatform = Platform.isAndroid || Platform.isIOS;
  late final PlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = sl<PlayerController>();
    autoHideControls();
  }

  @override
  void deactivate() {
    super.deactivate();
    controller.pause();
  }

  Timer? _debounce;
  Timer? _autoHideTimer;
  bool isControlsVisible = true;
  int forwardSkipSteps = 0;
  int backwardSkipSteps = 0;

  late final _textStyle = TextStyle(color: context.appColors.primaryContainer);

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
      if (controller.isPaused || controller.isBuffering || !isControlsVisible) return;
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
  Widget build(BuildContext context) => SignalBuilder(
    dependencies: [controller.playerFit],
    builder: (context) => PlayerScope(
      controller: controller,
      child: Video(fit: controller.playerFit.value, controller: controller.controller, controls: (_) => controlsBuilder),
    ),
  );

  ThemeData themeData(BuildContext context) => AppThemes.darkTheme.copyWith(
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        enabledMouseCursor: SystemMouseCursors.click,
        backgroundColor: context.appColors.primaryContainer.withAlpha(150),
        foregroundColor: context.appColors.onPrimaryContainer,
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
              return GestureDetector(
                excludeFromSemantics: true,
                behavior: HitTestBehavior.opaque,
                onTap: toggleControls,
                child: main,
              );
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

  Widget get controls => SignalBuilder(
    builder: (context) {
      final state = PlayerScope.of(context);
      final responsive = Responsive.of(context);
      return GestureDetector(
        onTap: responsive.isMobile ? null : controller.togglePlay,
        behavior: responsive.isMobile ? HitTestBehavior.translucent : HitTestBehavior.opaque,
        child: Focus(
          autofocus: true,
          child: Stack(
            alignment: AlignmentGeometry.center,
            fit: StackFit.expand,
            children: [
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
                    body: PlayerOverlayControls(bufferingIndicator: bufferingIndicator),
                  ),
                ),
              ),
              if (state.status == .error) errorBuilder(context, state.status, state.errorMessage),
            ],
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
    title: Padding(
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
                      Expanded(child: Text(controller.stream?.animeTitle ?? "", style: _textStyle)),
                    ],
                  )
          : Text(controller.stream?.animeTitle ?? "", style: _textStyle),
    ),
    actions: [topControls],
  );

  Container errorBuilder(BuildContext context, PlayerStatus status, String error) => Container(
    color: context.appColors.surface.withAlpha(100),
    constraints: .expand(width: 600),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Column(
        crossAxisAlignment: .center,
        mainAxisAlignment: .center,
        spacing: 10,
        children: [
          Text(
            status == .paid ? "Bu animeni ko'rish uchun obuna sotib oling" : error,
            style: context.textTheme.titleLarge,
            textAlign: .center,
          ),
          Row(
            mainAxisAlignment: .center,
            spacing: 10,
            children: [
              FilledButton.icon(onPressed: controller.reload, icon: Icon(Icons.replay), label: Text("Qayta boshlash")),
              FilledButton.icon(onPressed: controller.closeError, icon: Icon(Icons.close), label: Text("Yopish")),
            ],
          ),
        ],
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
          child: Text(
            step < 0 ? "$backwardSkipSteps" : "+$forwardSkipSteps",
            style: TextStyle(color: Colors.white, fontSize: 50),
          ),
        ),
      );
      if (!isMobile) return child;
      return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onDoubleTap: () => skip(step),
        onTap: toggleControls,
        child: child,
      );
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

  Widget get topControls => SignalBuilder(
    builder: (context) {
      final isFullscreen = controller.isFullscreen;
      final mediaType = controller.mediaType;
      final isMobile = Responsive.of(context).isMobileWidth;
      return Row(
        crossAxisAlignment: .center,
        spacing: 7,
        mainAxisAlignment: isMobile ? .end : .start,
        children: [
          if (mediaType.isSerie)
            IconButton(
              onPressed: Scaffold.of(context).openEndDrawer,
              iconSize: 25,
              padding: EdgeInsets.zero,
              icon: Icon(Icons.list_sharp),
            ),
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

  Widget get bufferingIndicator => IgnorePointer(
    ignoring: true,
    child: Opacity(
      opacity: controller.isBuffering ? 1 : 0,
      child: CircularProgressIndicator.adaptive(
        strokeWidth: 7,
        constraints: BoxConstraints.tightFor(width: 100, height: 100),
        strokeCap: StrokeCap.round,
        valueColor: AlwaysStoppedAnimation(context.appColors.primaryContainer),
      ),
    ),
  );

  Widget get bottomControls => SignalAnimatedBuilder(
    child: MouseRegion(
      cursor: SystemMouseCursors.click,
      child: SignalBuilder(
        builder: (context) => Focus(
          canRequestFocus: true,
          onKeyEvent: (node, event) => onKey(node, event, controller.progress, controller.duration),
          autofocus: true,
          child: ProgressBar(
            progress: controller.progress,
            buffered: controller.buffer,
            total: controller.duration,
            progressBarColor: context.appColors.primaryContainer,
            bufferedBarColor: context.appColors.primaryFixed.withAlpha(150),
            barHeight: 5,
            baseBarColor: context.appColors.primaryContainer.withAlpha(100),
            barCapShape: BarCapShape.round,
            thumbRadius: 7,
            thumbColor: context.appColors.onPrimary,
            thumbGlowRadius: 13,
            thumbGlowColor: context.appColors.primaryFixedDim.withAlpha(100),
            timeLabelPadding: 10,
            timeLabelTextStyle: TextStyle(color: _textStyle.color, fontWeight: FontWeight.bold, fontSize: 14),
            timeLabelLocation: TimeLabelLocation.sides,
            onSeek: (value) => controller.seek(value),
          ),
        ),
      ),
    ),
    builder: (context, child) {
      final status = controller.status;
      final stream = controller.stream;
      if (status == .empty) return SizedBox.shrink();
      final isMobile = Responsive.of(context).isMobileWidth;
      final type = stream?.type ?? .serie;
      return Container(
        constraints: BoxConstraints.tightFor(height: 200),
        padding: EdgeInsets.only(bottom: isMobile ? 30 : 50, left: isMobile ? 10 : 30, right: isMobile ? 10 : 30),
        child: Column(
          mainAxisAlignment: .end,
          spacing: 30,
          crossAxisAlignment: .start,
          children: [
            type.isSerie
                ? isMobile
                      ? Text(
                          "${stream?.episode}-qism ~ ${stream?.episodeTitle}",
                          style: context.textTheme.titleMedium!.merge(_textStyle),
                        )
                      : Row(
                          crossAxisAlignment: .end,
                          children: [
                            Expanded(
                              child: Text(
                                "${stream?.episode}-qism ~ ${stream?.episodeTitle}",
                                style: context.textTheme.titleMedium!.merge(_textStyle),
                              ),
                            ),
                            Center(child: PlayerOverlayControls(bufferingIndicator: bufferingIndicator, atOverlay: false)),
                            Expanded(child: SizedBox.shrink()),
                          ],
                        )
                : Align(
                    alignment: .bottomCenter,
                    child: PlayerOverlayControls(bufferingIndicator: bufferingIndicator, atOverlay: false),
                  ),
            child!,
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
      if (controller.hasIntro) controller.skipIntro();
    },
  };

  Widget get episodesDrawer => Drawer(width: 600, shape: Border(), child: EpisodesDrawer());

  Widget settingsDialog(BuildContext dialogcontext) {
    final videoTracks = controller.tracks!.video.toList();
    final audioTracks = controller.tracks!.audio.skip(2);
    return DefaultTabController(
      length: 2,
      child: AlertDialog(
        insetPadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        titlePadding: EdgeInsets.zero,
        title: TabBar(
          indicatorSize: .tab,
          tabs: [
            Tab(text: "Sifatlar", icon: Icon(Icons.video_settings_sharp)),
            Tab(text: "Ovozlar", icon: Icon(Icons.multitrack_audio_sharp)),
          ],
        ),
        clipBehavior: .antiAlias,
        actions: [OutlinedButton(onPressed: () => Navigator.pop(dialogcontext), child: Text("Bekor qilish"))],
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(20)),
        constraints: const BoxConstraints.tightFor(width: 400, height: 400),
        content: TabBarView(
          physics: BouncingScrollPhysics(),
          children: [
            ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: videoTracks.length,
              itemBuilder: (context, index) {
                final track = videoTracks.elementAt(index);
                final isCurrent = track.id == controller.videoTrack!.id;
                final title = track.h?.toString() ?? track.w?.toString() ?? track.id;
                final isId = title == track.id;
                return ListTile(
                  leading: Icon(isCurrent ? Icons.check : Icons.hd),
                  onTap: () {
                    controller.setResolution(track);
                    Navigator.pop(dialogcontext);
                  },
                  title: Text(!isId ? "${title}p" : title),
                );
              },
            ),
            ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: audioTracks.length,
              itemBuilder: (context, index) {
                final track = audioTracks.elementAt(index);
                return ListTile(
                  leading: Icon(Icons.audiotrack_rounded),
                  onTap: () {
                    controller.setAudio(track);
                    Navigator.pop(dialogcontext);
                  },
                  title: Text(track.title ?? track.language ?? track.id),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
