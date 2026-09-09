import 'package:application/core/utils/base_url.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';

class SafeImage extends CachedNetworkImage {
  SafeImage({super.key, super.fit, super.alignment, super.color, super.height, super.width, super.scale, super.repeat, required super.imageUrl});

  @override
  Widget build(BuildContext context) {
    if (isUsable(imageUrl)) return super.build(context);
    return Image.asset("assets/images/poster.png", fit: fit, alignment: alignment, color: color, height: height, width: width, repeat: repeat);
  }
}
