import 'package:flutter/material.dart';

enum DevicePlatform { mobile, desktop }

enum Device {
  unknown,
  ios,
  linux,
  windows,
  macos,
  android;

  factory Device.fromString(String str) {
    switch (str) {
      case 'ios':
        return Device.ios;
      case 'android':
        return Device.android;
      case 'windows':
        return Device.windows;
      case 'macos':
        return Device.macos;
      case 'linux':
        return Device.linux;
      default:
        return Device.unknown;
    }
  }
  static IconData getDeviceIcon(Device device) {
    switch (device) {
      case Device.ios:
        return Icons.apple;
      case Device.android:
        return Icons.android;
      case Device.linux:
        return Icons.computer;
      case Device.macos:
        return Icons.computer;
      case Device.windows:
        return Icons.window;
      case Device.unknown:
        return Icons.devices;
    }
  }
}
