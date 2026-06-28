import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:native_splash_screen/native_splash_screen.dart' as splash_screen;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:window_manager/window_manager.dart';

class Utils {
  static bool isMobilePlatform = Platform.isIOS || Platform.isAndroid;
  static bool isDesktopPlatform = Platform.isLinux || Platform.isMacOS || Platform.isWindows;

  static Future<void> initFullscreen() async {
    if (isMobilePlatform) return;
    await windowManager.ensureInitialized();
    WindowOptions windowOptions = WindowOptions(
      size: Size(800, 600),
      title: "Anibla.uz Birinchi uz fandab!",
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: Platform.isLinux ? TitleBarStyle.hidden : TitleBarStyle.normal,
    );

    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.maximize();
      await windowManager.show();
      await windowManager.focus();
    });
  }

  static Future<void> enterFullScreen() async {
    if (isDesktopPlatform) {
      await windowManager.setFullScreen(true);
      return;
    }
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  }

  static Future<void> exitFullScreen() async {
    if (isDesktopPlatform) {
      await windowManager.setFullScreen(false);
      return;
    }
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  static Future<void> closeSplashScreen() async {
    if (isMobilePlatform) return;
    await splash_screen.close(animation: splash_screen.CloseAnimation.fade);
  }

  static Future<bool> checkIsOnline() async {
    final connections = await (Connectivity().checkConnectivity());
    return connections.contains(ConnectivityResult.ethernet) ||
        connections.contains(ConnectivityResult.mobile) ||
        connections.contains(ConnectivityResult.wifi);
  }

  static void imageErrorListener(Object obj) {}
}
