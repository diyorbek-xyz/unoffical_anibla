import 'package:application/shared/utils/extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImagePreview extends StatefulWidget {
  final List<String> images;
  final int current;
  const ImagePreview(this.images, {super.key, this.current = 0});

  @override
  State<ImagePreview> createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  late final controller = PageController(initialPage: widget.current);

  void nextPage() => controller.animateToPage(0, duration: Duration(milliseconds: 100), curve: Curves.bounceIn);
  void prevPage() => controller.animateToPage(0, duration: Duration(milliseconds: 100), curve: Curves.bounceIn);

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      backgroundColor: Colors.transparent,
      child: Stack(
        fit: .expand,
        children: [
          CarouselView.weighted(
            flexWeights: context.isMobile ? [1] : [1, 6, 1],
            backgroundColor: Colors.transparent,
            itemSnapping: true,
            enableSplash: false,
            children: widget.images.map((e) => CachedNetworkImage(imageUrl: e, fit: .contain)).toList(),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              iconSize: 36,
              constraints: .expand(width: 72, height: 72),
              icon: Icon(Icons.close),
            ),
          ),
        ],
      ),
    );
  }
}
