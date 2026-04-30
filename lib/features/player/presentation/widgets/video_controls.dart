import 'package:flutter/widgets.dart';
import 'dart:async';
import 'dart:io';
import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/features/animes/presentation/widgets/episodes_list.dart';
import 'package:application/features/common/presentation/widgets/responsive.dart';
import 'package:application/features/player/presentation/cubit/player_controller.dart';
import 'package:application/features/player/presentation/cubit/player_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:rxdart/rxdart.dart';

class VideoControls extends StatefulWidget {
  const VideoControls({super.key});

  @override
  State<VideoControls> createState() => _VideoControlsState();
}

class _VideoControlsState extends State<VideoControls> {
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
    controller.pause();
    super.deactivate();
  }

  int forwardSkipSteps = 0;
  int backwardSkipSteps = 0;

  Timer? _debounce;
  bool isControlsVisible = true;

  Timer? _autoHideTimer;

  void toggleControls() => autoHideControls(!isControlsVisible);

  void hideControls() {
    _autoHideTimer?.cancel();
    setState(() => isControlsVisible = false);
  }

  void autoHideControls([bool? value]) {
    _autoHideTimer?.cancel();
    setState(() => isControlsVisible = value ?? true);
    _autoHideTimer = Timer(const Duration(seconds: 3), () {
      final state = controller.state;
      if (state.isPaused || state.buffering || !mounted) return;
      setState(() => isControlsVisible = false);
    });
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

  void openSettings() => showDialog(context: context, builder: settingsDialog);

  void openEpisodeList() => showDialog(context: context, builder: episodesList);

  @override
  Widget build(BuildContext context) {
    return Material(
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
    );
  }

  Widget get controls => Builder(
    builder: (BuildContext context) {
      final responsive = Responsive.of(context);
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
            builder: (_, state) => GestureDetector(
              onTap: () => controller.togglePlay(),
              behavior: responsive.isMobile ? HitTestBehavior.translucent : HitTestBehavior.opaque,
              child: Focus(
                autofocus: true,
                child: Stack(
                  alignment: AlignmentGeometry.center,
                  fit: StackFit.expand,
                  children: [
                    if (controller.state.buffering)
                      Center(
                        child: CircularProgressIndicator.adaptive(
                          strokeWidth: 7,
                          constraints: BoxConstraints.tightFor(width: 100, height: 100),
                          strokeCap: StrokeCap.round,
                          valueColor: AlwaysStoppedAnimation(context.appColors.primary),
                        ),
                      ),
                    skippers,
                    AnimatedOpacity(
                      opacity: isControlsVisible ? 1 : 0,
                      duration: Duration(milliseconds: 200),
                      child: IgnorePointer(
                        ignoring: !isControlsVisible,
                        child: Stack(
                          alignment: AlignmentGeometry.center,
                          fit: .expand,
                          children: [
                            if (responsive.isMobile) topControls,
                            bottomControls,
                            overlayControls,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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

  Widget get topControls => BlocSelector<PlayerController, PlayerStates, bool>(
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
                padding: EdgeInsets.zero,
                icon: Icon(Icons.list_sharp),
              ),
              IconButton(
                onPressed: controller.toggleFit,
                iconSize: 25,
                padding: EdgeInsets.zero,
                icon: Icon(Icons.fit_screen_sharp),
              ),
              IconButton(
                onPressed: openSettings,
                iconSize: 25,
                padding: EdgeInsets.zero,
                icon: Icon(Icons.settings_sharp),
              ),
              IconButton(
                onPressed: () => controller.toggleFullscreen(context),
                iconSize: 25,
                padding: EdgeInsets.zero,
                icon: Icon(isFullscreen ? Icons.fullscreen_exit_sharp : Icons.fullscreen_sharp),
              ),
            ],
          ),
        ),
      );
    },
  );

  Widget get overlayControls => Builder(
    builder: (local) {
      final responsive = Responsive.of(local);
      return Row(
        crossAxisAlignment: .center,
        mainAxisAlignment: .center,
        spacing: 20,
        children: [
          if (responsive.isMobile)
            Opacity(
              opacity: controller.state.isFirst ? 0 : 1,
              child: IconButton(
                onPressed: () {
                  if (isControlsVisible) controller.previousEpisode();
                },
                padding: EdgeInsets.all(10),
                iconSize: 40,
                icon: Icon(Icons.skip_previous),
              ),
            ),
          if (responsive.isMobile || controller.state.isPaused)
            IconButton(
              onPressed: controller.togglePlay,
              padding: EdgeInsets.all(10),
              iconSize: 50,
              isSelected: controller.state.isPaused,
              selectedIcon: Icon(Icons.play_arrow),
              icon: Icon(Icons.pause),
            ),
          if (responsive.isMobile)
            Opacity(
              opacity: controller.state.isLast ? 0 : 1,
              child: IconButton(
                onPressed: () {
                  if (isControlsVisible) controller.nextEpisode();
                },
                padding: EdgeInsets.all(10),
                iconSize: 40,
                icon: Icon(Icons.skip_next),
              ),
            ),
        ],
      );
    },
  );

  Widget get bottomControls => Builder(
    builder: (local) {
      final state = controller.state;
      final responsive = Responsive.of(local);
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
            if (responsive.isMobile || state.isFullscreen)
              Container(
                padding: EdgeInsets.all(7),
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

            Container(
              color: context.appColors.onPrimary.withAlpha(80),
              padding: EdgeInsets.symmetric(
                horizontal: responsive.isMobile ? 10 : 20,
                vertical: 10,
              ),
              child: Column(
                mainAxisSize: .min,
                spacing: 10,
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: StreamBuilder(
                      stream: Rx.combineLatest2(
                        state.progressStream,
                        state.bufferStream,
                        (a, b) => (a, b),
                      ),
                      builder: (_, progress) {
                        final (time, buffer) = progress.data ?? (state.seekProgress, Duration.zero);
                        return ProgressBar(
                          progress: time,
                          progressBarColor: context.appColors.primary,
                          buffered: buffer,
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
                            fontSize: 14,
                          ),
                          timeLabelLocation: TimeLabelLocation.above,
                          onSeek: (value) => controller.seek(value),
                        );
                      },
                    ),
                  ),
                  if (!responsive.isMobile)
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
                            IconButton(onPressed: openEpisodeList, icon: Icon(Icons.list_sharp)),
                            IconButton(
                              onPressed: controller.toggleFit,
                              icon: Icon(Icons.fit_screen_sharp),
                            ),
                            IconButton(onPressed: openSettings, icon: Icon(Icons.settings_sharp)),
                            IconButton(
                              onPressed: () => controller.toggleFullscreen(context),
                              icon: Icon(
                                state.isFullscreen
                                    ? Icons.fullscreen_exit_sharp
                                    : Icons.fullscreen_sharp,
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

  Widget episodesList(BuildContext context) {
    return BlocProvider.value(
      value: controller,
      child: Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 20),
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
  }

  Widget settingsDialog(BuildContext dialogcontext) {
    final state = controller.state;
    final tracks = state.tracks.video
        .where((element) => element.toString().contains("auto") || element.h != null)
        .toList();
    return DefaultTabController(
      length: 2,
      child: Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 100),
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(20)),
        constraints: const BoxConstraints(maxWidth: 400, maxHeight: 400),
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
                  ListView.builder(
                    itemCount: state.tracks.audio.length,
                    itemBuilder: (context, index) {
                      final track = state.tracks.audio.elementAt(index);
                      final title = "${track.id} ${track.samplerate} ${track.channels}";
                      final isId = title == track.id;
                      return ListTile(
                        leading: Icon(Icons.hd),
                        onTap: () {
                          Navigator.pop(dialogcontext);
                          controller.setAudio(track);
                        },
                        title: Text(!isId ? "${title}p" : title),
                      );
                    },
                  ),
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
  }
}
