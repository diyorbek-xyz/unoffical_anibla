import 'package:application/presentation/model/episode_ui.dart';
import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class VideoPlayer extends StatefulWidget {
  final VideoUiModel? video;
  const VideoPlayer({super.key, required this.video});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late final _player = Player();
  late final _controller = VideoController(_player);
  bool loaded = false;

  Future<void> _loadVideo(String video) async {
    await _controller.player.open(Media(video));
    setState(() {
      loaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.video != null) {
      _loadVideo(widget.video!.file);
    }
  }

  @override
  void didChangeDependencies() {
    if (widget.video != null) {
      _loadVideo(widget.video!.file);
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Video(controller: _controller);
  }
}
