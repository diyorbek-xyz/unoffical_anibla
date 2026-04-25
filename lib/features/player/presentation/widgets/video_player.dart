import 'dart:async';
import 'package:application/features/player/presentation/cubit/player_controller.dart';
import 'package:application/features/player/presentation/cubit/player_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  final isMobilePlatform = true;
  void openSettings(BuildContext context, PlayerReady state, PlayerController controller) {
    showDialog(
      context: context,
      builder: (context) {
        return DefaultTabController(
          length: 2,
          child: Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(20)),
            constraints: BoxConstraints(maxWidth: 500, maxHeight: 500),
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
                            onTap: () => controller.setResolution(track),
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
                    onPressed: () => Navigator.pop(context),
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

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(iconColor: WidgetStatePropertyAll(Colors.white)),
        ),
      ),
      child: BlocBuilder<PlayerController, PlayerStates>(
        builder: (context, state) {
          switch (state) {
            case PlayerError():
              return Container(
                color: Colors.black,
                alignment: AlignmentGeometry.center,
                child: Text(state.message, style: TextStyle(color: Colors.white)),
              );
            case PlayerReady():
              return LayoutBuilder(
                builder: (context, constraints) {
                  final isMobile = isMobilePlatform || constraints.maxWidth < 500;
                  final controller = context.read<PlayerController>();
                  final state = controller.state as PlayerReady;

                  return Stack(
                    fit: StackFit.expand,
                    alignment: AlignmentGeometry.center,
                    children: [
                      Video(controller: controller.controller, controls: NoVideoControls),
                      skippers(controller),

                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            topControlsContainer(
                              Text(
                                state.currentMedia.extras?['title'] ?? '',
                                style: TextStyle(fontSize: 20, color: Colors.white),
                              ),
                            ),
                            if (isMobile)
                              topControlsContainer(
                                Row(
                                  crossAxisAlignment: .center,
                                  children: [
                                    IconButton(
                                      onPressed: () => openSettings(context, state, controller),
                                      iconSize: 30,
                                      padding: EdgeInsets.all(10),
                                      color: Colors.white,
                                      icon: Icon(Icons.settings),
                                    ),
                                    IconButton(
                                      onPressed: () => controller.toggleFullscreen(context, widget),
                                      iconSize: 30,
                                      padding: EdgeInsets.all(10),
                                      color: Colors.white,
                                      icon: Icon(
                                        state.isFullscreen
                                            ? Icons.fullscreen_exit
                                            : Icons.fullscreen,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: playerControls(context, isMobile, controller, state),
                      ),
                      Row(
                        crossAxisAlignment: .center,
                        mainAxisAlignment: .center,
                        spacing: 20,
                        children: [
                          IconButton(
                            onPressed: controller.previousMedia,
                            padding: EdgeInsets.all(10),
                            iconSize: 40,
                            icon: Icon(Icons.fast_rewind),
                          ),
                          IconButton(
                            onPressed: controller.togglePlay,
                            padding: EdgeInsets.all(10),
                            iconSize: 50,
                            isSelected: state.isPaused,
                            selectedIcon: Icon(Icons.play_arrow),
                            icon: Icon(Icons.pause),
                          ),
                          IconButton(
                            onPressed: controller.nextMedia,
                            padding: EdgeInsets.all(10),
                            iconSize: 40,
                            icon: Icon(Icons.fast_forward),
                          ),
                        ],
                      ),
                      if (state.buffering) Center(child: CircularProgressIndicator.adaptive()),
                    ],
                  );
                },
              );
            default:
              return Text("");
          }
        },
      ),
    );
  }

  Widget topControlsContainer(Widget child) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Material(
        color: Colors.black38,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 60,
          alignment: AlignmentGeometry.center,
          padding: EdgeInsetsGeometry.symmetric(horizontal: 30),
          child: child,
        ),
      ),
    );
  }

  int forwardSkipSteps = 0;
  int backwardSkipSteps = 0;

  Timer? _debounce;

  Row skippers(PlayerController controller) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(child: skipper(controller, -5)),
        Expanded(child: skipper(controller, 5)),
      ],
    );
  }

  InkWell skipper(PlayerController controller, int step) {
    void skip() async {
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

    final skipping = (step < 0 && backwardSkipSteps != 0) || (step > 0 && forwardSkipSteps != 0);
    return InkWell(
      onDoubleTap: skip,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: skipping ? 200 : 0),
        opacity: skipping ? 1 : 0,
        child: Align(
          alignment: AlignmentGeometry.center,
          child: Text(
            step < 0 ? "$backwardSkipSteps" : "$forwardSkipSteps",
            style: TextStyle(color: Colors.white, fontSize: 50),
          ),
        ),
      ),
    );
  }

  Widget playerControls(
    BuildContext context,
    bool isMobile,
    PlayerController controller,
    PlayerReady state,
  ) => Container(
    color: Colors.black45,
    padding: EdgeInsets.symmetric(horizontal: isMobile ? 10 : 20, vertical: 10),
    child: Column(
      mainAxisSize: .min,
      spacing: 10,
      children: [
        timeBar(state, isMobile, controller),
        if (!isMobilePlatform) desktopControls(controller, state, isMobile, context),
      ],
    ),
  );

  Widget timeBar(PlayerReady state, bool isMobile, PlayerController controller) {
    return ProgressBar(
      thumbCanPaintOutsideBar: false,
      thumbColor: Color(0xFFFF0000),
      bufferedBarColor: Colors.white38,
      barCapShape: BarCapShape.square,
      progressBarColor: Color(0xFFFF0000),
      thumbGlowColor: Color(0x60FF0000),
      baseBarColor: Colors.white38,
      timeLabelTextStyle: TextStyle(color: Colors.white),
      thumbRadius: 7,
      thumbGlowRadius: 13,
      barHeight: 5,
      progress: state.time,
      buffered: state.buffer,
      total: state.duration,
      timeLabelLocation: isMobile ? TimeLabelLocation.above : TimeLabelLocation.sides,
      timeLabelPadding: 10,
      onSeek: (value) => controller.seek(value),
    );
  }

  Widget desktopControls(
    PlayerController controller,
    PlayerReady state,
    bool isMobile,
    BuildContext context,
  ) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: controller.togglePlay,
              icon: Icon(state.isPaused ? Icons.play_arrow : Icons.pause),
            ),
            IconButton(
              onPressed: controller.toggleMute,
              icon: Icon(state.isMuted ? Icons.volume_off : Icons.volume_up),
            ),
            SizedBox(
              width: 100,
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 3.0,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 7.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 10.0),
                ),
                child: Slider(
                  thumbColor: Colors.white,
                  activeColor: Colors.white,
                  inactiveColor: Colors.white54,
                  value: state.volume,
                  max: 100,
                  onChanged: (value) => controller.setVolume(value),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              onPressed: () => controller.toggleFullscreen(context, widget),
              icon: Icon(state.isFullscreen ? Icons.fullscreen_exit : Icons.fullscreen),
            ),
          ],
        ),
      ],
    );
  }
}
