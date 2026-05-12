import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';

class ImageWithFallback extends StatelessWidget {
  final String image;
  const ImageWithFallback({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      errorWidget: (context, url, error) =>
          Image.asset("assets/images/image.jpg"),
    );
  }
}