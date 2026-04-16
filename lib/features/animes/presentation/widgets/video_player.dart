import 'package:application/features/animes/presentation/bloc/video/video_bloc.dart';
import 'package:application/features/animes/presentation/bloc/video/video_event.dart';
import 'package:application/features/animes/presentation/bloc/video/video_state.dart' as video;
import 'package:application/features/common/presentation/widgets/error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class VideoPlayer extends StatefulWidget {
  final String path;
  final String title;

  const VideoPlayer({super.key, required this.title, required this.path});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late final Player player = Player();
  late final VideoController controller = VideoController(player);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    player.pause();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VideoBloc, video.VideoState>(
      listenWhen: (previous, current) => (previous != current) && current is video.VideoSuccess,
      listener: (context, state) {
        if (state is! video.VideoSuccess) {
          player.dispose();
        }
        if (state is video.VideoSuccess) {
          player.open(Media(state.video.file));
        }
      },
      builder: (context, state) {
        switch (state) {
          case video.VideoIsPaid():
            return Column(
              crossAxisAlignment: .center,
              mainAxisAlignment: .center,
              children: [
                Text("Bu qismni ko'rish uchun obuna sotib oling"),
                ElevatedButton(onPressed: () {}, child: Text("Tariflar")),
              ],
            );
          case video.VideoFailure():
            return ErrorBuilder(
              message: state.message,
              refresh: () => context.read<VideoBloc>().add(GetVideo(widget.path)),
            );
          case video.VideoLoading():
            return Center(child: CircularProgressIndicator.adaptive());
          case video.VideoSuccess():
            return Video(controller: controller);
          default:
            return Text('Nimadur xato ketti');
        }
      },
    );
  }
}
