import 'dart:io';

import 'package:flutter/services.dart';
import 'package:window_manager/window_manager.dart';

class Utils {
  static bool isMobilePlatform = Platform.isIOS || Platform.isIOS;
  static bool isDesktopPlatform = Platform.isLinux || Platform.isMacOS || Platform.isWindows;

  static Future<void> enterFullScreen() async {
    if (isDesktopPlatform) {
      await windowManager.setFullScreen(true);
      return;
    }
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  static Future<void> exitFullScreen() async {
    if (isDesktopPlatform) {
      await windowManager.setFullScreen(false);
      return;
    }
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
