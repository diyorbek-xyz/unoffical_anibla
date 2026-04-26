import 'dart:async';
import 'dart:io';
import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/features/animes/presentation/widgets/episodes_list.dart';
import 'package:application/features/player/presentation/cubit/player_controller.dart';
import 'package:application/features/player/presentation/cubit/player_states.dart';
import 'package:application/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:media_kit_video/media_kit_video.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  final isMobilePlatform = Platform.isAndroid || Platform.isIOS;
  late PlayerController controller;

  int forwardSkipSteps = 0;
  int backwardSkipSteps = 0;

  Timer? _debounce;
  bool isControlsVisible = true;

  Timer? _autoHideTimer;

  void toggleControls() => showControls(!isControlsVisible);

  void showControls([bool? value]) {
    setState(() => isControlsVisible = value ?? true);
    _autoHideTimer?.cancel();
    _autoHideTimer = Timer(const Duration(seconds: 3), () {
      final state = controller.state;
      if (state.isPaused || state.buffering) return;
      if (!mounted) return;
      setState(() => isControlsVisible = false);
    });
  }

  @override
  void deactivate() {
    controller.pause();
    super.deactivate();
  }

  @override
  void initState() {
    controller = context.read<PlayerController>();
    super.initState();
  }

  void skip(int step) async {
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

  void openSettings() {
    showDialog(
      context: context,
      builder: (dialogcontext) {
        final controller = context.read<PlayerController>();
        final state = controller.state;
        return DefaultTabController(
          length: 2,
          child: Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(20)),
            constraints: const BoxConstraints(maxWidth: 500, maxHeight: 500),
            child: Column(
              children: [
                const TabBar(
                  tabs: [
                    Tab(text: "Sifatlar"),
                    Tab(text: "Tezlik"),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      ListView.builder(
                        itemCount: state.tracks.video.length,
                        itemBuilder: (context, index) {
                          final track = state.tracks.video.elementAt(index);
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
                      Text(state.tracks.toString()),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  padding: EdgeInsets.all(5),
                  alignment: AlignmentGeometry.centerEnd,
                  child: TextButton(
                    onPressed: () => Navigator.pop(dialogcontext),
                    child: Text("Bekor qilish"),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void openEpisodeList() {
    final controller = context.read<PlayerController>();
    showDialog(
      context: context,
      builder: (context) {
        return BlocProvider.value(
          value: controller,
          child: Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(20)),
            clipBehavior: Clip.antiAlias,
            constraints: const BoxConstraints(maxWidth: 500, maxHeight: 500),
            child: Stack(
              alignment: .bottomRight,
              children: [
                EpisodesList(onItemPressed: () => Navigator.pop(context)),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: FilledButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.keyboard_arrow_left),
                    label: Text("Ortga"),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Map<ShortcutActivator, VoidCallback> get keyBindings => <ShortcutActivator, VoidCallback>{
    const SingleActivator(LogicalKeyboardKey.keyF): () =>
        controller.toggleFullscreen(context, widget),
    const SingleActivator(LogicalKeyboardKey.space, includeRepeats: false): () {
      showControls();
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

  @override
  Widget build(BuildContext root) {
    return Theme(
      data: ThemeData(
        useMaterial3: true,
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            mouseCursor: WidgetStatePropertyAll(SystemMouseCursors.click),
            iconColor: WidgetStatePropertyAll(Colors.white),
            backgroundColor: WidgetStatePropertyAll(
              context.appColors.primaryContainer.withAlpha(150),
            ),
            foregroundColor: WidgetStatePropertyAll(context.appColors.primary),
          ),
        ),
      ),
      child: CallbackShortcuts(
        bindings: keyBindings,
        child: BlocBuilder<PlayerController, PlayerStates>(
          buildWhen: (previous, current) => previous.diffirence(current) > 0,
          builder: (_, state) => LayoutBuilder(
            builder: (_, constraints) {
              final isMobile = isMobilePlatform || constraints.maxWidth < MOBILE_WIDTH;
              final main = Focus(
                autofocus: true,
                child: Stack(
                  fit: StackFit.expand,
                  alignment: AlignmentGeometry.center,
                  children: [videoElement(isMobile), controls(isMobile)],
                ),
              );
              if (isMobile) {
                return GestureDetector(
                  excludeFromSemantics: true,
                  behavior: HitTestBehavior.opaque,
                  onTap: toggleControls,
                  child: main,
                );
              }
              return MouseRegion(
                cursor: isControlsVisible ? MouseCursor.defer : SystemMouseCursors.none,
                onExit: (event) => setState(() => isControlsVisible = false),
                onHover: (event) => showControls(),
                onEnter: (event) => showControls(),
                child: Listener(
                  onPointerMove: (event) => showControls(),
                  onPointerDown: (event) => showControls(),
                  onPointerUp: (event) => showControls(),
                  child: main,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget videoElement(bool isMobile) => GestureDetector(
    onTap: () {
      if (!isMobile) controller.togglePlay();
    },
    child: Video(controller: controller.controller, controls: NoVideoControls),
  );

  Stack controls(bool isMobile) {
    return Stack(
      alignment: AlignmentGeometry.center,
      fit: StackFit.expand,
      children: [
        if (controller.state.buffering)
          Center(
            child: SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation(context.appColors.primary),
              ),
            ),
          ),
        skippers(isMobile),
        AnimatedOpacity(
          opacity: isControlsVisible ? 1 : 0,
          duration: Duration(milliseconds: 100),
          child: Stack(
            alignment: AlignmentGeometry.center,
            fit: .expand,
            children: [
              if (isMobile) topControls(isMobile),
              playerControls(isMobile),
              if (!controller.state.buffering) overlayControls(isMobile),
            ],
          ),
        ),
      ],
    );
  }

  Widget skippers(bool isMobile) {
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

    return Row(
      mainAxisAlignment: .spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(child: skipper(-5, isMobile)),
        Expanded(child: skipper(5, isMobile)),
      ],
    );
  }

  Widget topControls(bool isMobile) {
    return BlocSelector<PlayerController, PlayerStates, bool>(
      selector: (state) => state.isFullscreen,
      builder: (context, isFullscreen) {
        return Positioned(
          top: 0,
          right: 0,
          child: Container(
            margin: EdgeInsets.all(10),
            height: 50,
            alignment: AlignmentGeometry.center,
            padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              crossAxisAlignment: .center,
              mainAxisAlignment: .spaceBetween,
              spacing: 7,
              children: [
                IconButton(
                  onPressed: openEpisodeList,
                  iconSize: 25,
                  padding: EdgeInsets.all(0),
                  icon: Icon(Icons.list),
                ),
                IconButton(
                  onPressed: openSettings,
                  iconSize: 25,
                  padding: EdgeInsets.all(0),
                  icon: Icon(Icons.settings),
                ),
                IconButton(
                  onPressed: () => controller.toggleFullscreen(context, widget),
                  iconSize: 25,
                  padding: EdgeInsets.all(0),
                  icon: Icon(isFullscreen ? Icons.fullscreen_exit : Icons.fullscreen),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget overlayControls(bool isMobile) {
    return Row(
      crossAxisAlignment: .center,
      mainAxisAlignment: .center,
      spacing: 20,
      children: [
        if (isMobile)
          Opacity(
            opacity: controller.state.isFirst ? 0 : 1,
            child: IconButton(
              onPressed: controller.previousEpisode,
              padding: EdgeInsets.all(10),
              iconSize: 40,
              icon: Icon(Icons.skip_previous),
            ),
          ),
        if (isMobile || controller.state.isPaused)
          IconButton(
            onPressed: controller.togglePlay,
            padding: EdgeInsets.all(10),
            iconSize: 50,
            isSelected: controller.state.isPaused,
            selectedIcon: Icon(Icons.play_arrow),
            icon: Icon(Icons.pause),
          ),
        if (isMobile)
          Opacity(
            opacity: controller.state.isLast ? 0 : 1,
            child: IconButton(
              onPressed: controller.nextEpisode,
              padding: EdgeInsets.all(10),
              iconSize: 40,
              icon: Icon(Icons.skip_next),
            ),
          ),
      ],
    );
  }

  Widget playerControls(bool isMobile) {
    final state = controller.state;
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Column(
        children: [
          if (state.hasIntro)
            Align(
              alignment: AlignmentGeometry.centerEnd,
              child: Padding(
                padding: EdgeInsets.only(bottom: 30, right: 30),
                child: InkWell(
                  onTap: controller.skipIntro,
                  child: Ink(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: context.appColors.primary,
                    ),
                    child: Text(
                      "Introni o'tkazish",
                      style: TextStyle(color: context.appColors.onPrimary),
                    ),
                  ),
                ),
              ),
            ),
          Container(
            color: context.appColors.onPrimary.withAlpha(80),
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 10 : 20, vertical: 10),
            child: Column(
              mainAxisSize: .min,
              spacing: 10,
              children: [
                if (isMobile)
                  Align(
                    alignment: AlignmentGeometry.centerStart,
                    child: Text(
                      "${state.episode.episodeNumber}-qism: ${state.episode.title.uz}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: context.appColors.onPrimaryContainer,
                      ),
                    ),
                  ),
                BlocBuilder<PlayerController, PlayerStates>(
                  builder: (_, state) {
                    return MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: ProgressBar(
                        progress: state.time,
                        progressBarColor: context.appColors.primary,
                        buffered: state.buffer,
                        bufferedBarColor: context.appColors.primaryFixed.withAlpha(100),
                        total: state.duration,
                        barHeight: 5,
                        baseBarColor: context.appColors.onPrimary.withAlpha(100),
                        barCapShape: BarCapShape.round,
                        thumbRadius: 7,
                        thumbColor: context.appColors.primaryFixed,
                        thumbGlowRadius: 13,
                        thumbGlowColor: context.appColors.primaryFixedDim.withAlpha(100),
                        thumbCanPaintOutsideBar: false,
                        timeLabelPadding: 10,
                        timeLabelTextStyle: TextStyle(
                          color: context.appColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: isMobile ? 12 : 16,
                        ),
                        timeLabelLocation: isMobile
                            ? TimeLabelLocation.below
                            : TimeLabelLocation.sides,
                        onSeek: (value) => controller.seek(value),
                      ),
                    );
                  },
                ),
                if (!isMobile)
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Row(
                        spacing: 7,
                        children: [
                          IconButton(
                            constraints: BoxConstraints.tightFor(width: 50, height: 50),
                            iconSize: 35,
                            onPressed: controller.togglePlay,
                            isSelected: state.isPaused,
                            selectedIcon: Icon(Icons.play_arrow),
                            icon: Icon(Icons.pause),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: context.appColors.primaryContainer.withAlpha(150),
                            ),
                            child: Row(
                              children: [
                                if (!state.isFirst)
                                  IconButton(
                                    style: ButtonStyle(
                                      backgroundColor: WidgetStatePropertyAll(Colors.transparent),
                                    ),
                                    onPressed: controller.previousEpisode,
                                    icon: Icon(Icons.skip_previous),
                                  ),
                                if (!state.isLast)
                                  IconButton(
                                    style: ButtonStyle(
                                      backgroundColor: WidgetStatePropertyAll(Colors.transparent),
                                    ),
                                    onPressed: controller.nextEpisode,
                                    icon: Icon(Icons.skip_next),
                                  ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: context.appColors.primaryContainer.withAlpha(150),
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: controller.toggleMute,
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(Colors.transparent),
                                  ),
                                  icon: Icon(
                                    state.isMuted
                                        ? Icons.volume_mute
                                        : state.volume <= 50
                                        ? Icons.volume_down
                                        : Icons.volume_up,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(right: 10),
                                  width: 100,
                                  child: SliderTheme(
                                    data: SliderTheme.of(context).copyWith(
                                      trackHeight: 3.0,
                                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 7.0),
                                      overlayShape: RoundSliderOverlayShape(overlayRadius: 10.0),
                                    ),
                                    child: Slider(
                                      thumbColor: context.appColors.primaryFixed,
                                      activeColor: context.appColors.primary,
                                      inactiveColor: context.appColors.onPrimary.withAlpha(100),
                                      divisions: 10,
                                      value: state.volume,
                                      max: 100,
                                      onChanged: (value) => controller.setVolume(value),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        spacing: 7,
                        children: [
                          IconButton(onPressed: openEpisodeList, icon: Icon(Icons.list)),
                          IconButton(onPressed: openSettings, icon: Icon(Icons.settings)),
                          IconButton(
                            onPressed: () => controller.toggleFullscreen(context, widget),
                            icon: Icon(
                              state.isFullscreen ? Icons.fullscreen_exit : Icons.fullscreen,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
