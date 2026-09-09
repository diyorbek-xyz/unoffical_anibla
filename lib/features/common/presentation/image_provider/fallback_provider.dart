import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SafeImageProvider extends ImageProvider<SafeImageProvider> {
  const SafeImageProvider(this.primaryProvider, {required this.fallbackProvider});

  final ImageProvider primaryProvider;
  final ImageProvider fallbackProvider;

  @override
  Future<SafeImageProvider> obtainKey(ImageConfiguration configuration) {
    return SynchronousFuture<SafeImageProvider>(this);
  }

  @override
  ImageStreamCompleter loadImage(SafeImageProvider key, ImageDecoderCallback decode) {
    return OneFrameImageStreamCompleter(_loadAsync(key, decode));
  }

  Future<ImageInfo> _loadAsync(SafeImageProvider key, ImageDecoderCallback decode) async {
    try {
      // Attempt to load the primary image format
      return await _resolveImage(primaryProvider, decode);
    } catch (_) {
      // Fallback if primary fails or format is unsupported
      return await _resolveImage(fallbackProvider, decode);
    }
  }

  Future<ImageInfo> _resolveImage(ImageProvider provider, ImageDecoderCallback decode) async {
    final Completer<ImageInfo> completer = Completer<ImageInfo>();
    final ImageStream stream = provider.resolve(ImageConfiguration.empty);

    late final ImageStreamListener listener;
    listener = ImageStreamListener(
      (ImageInfo info, bool synchronousCall) {
        if (!completer.isCompleted) completer.complete(info);
        stream.removeListener(listener);
      },
      onError: (Object error, StackTrace? stackTrace) {
        if (!completer.isCompleted) completer.completeError(error);
        stream.removeListener(listener);
      },
    );

    stream.addListener(listener);
    return completer.future;
  }

  @override
  bool operator ==(Object other) =>
      other is SafeImageProvider && primaryProvider == other.primaryProvider && fallbackProvider == other.fallbackProvider;

  @override
  int get hashCode => Object.hash(primaryProvider, fallbackProvider);
}

ImageProvider imageProviderFallback(String url) =>
    SafeImageProvider(CachedNetworkImageProvider(url), fallbackProvider: AssetImage("assets/images/poster.png"));
