import 'package:application/features/anibla/data/models/props/media_props.dart';
import 'package:application/features/anibla/data/view_model/media_view.dart';
import 'package:material_ui/material_ui.dart';

class MediaPageV3 extends StatefulWidget {
  final MediaProps mediaProps;
  final MediaView mediaInfos;
  const MediaPageV3({super.key, required this.mediaInfos, required this.mediaProps});

  @override
  State<MediaPageV3> createState() => _MediaPageV3State();
}

class _MediaPageV3State extends State<MediaPageV3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: .symmetric(horizontal: 20),
        child: Column(children: []),
      ),
    );
  }
}
