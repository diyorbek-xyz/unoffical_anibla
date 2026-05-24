import 'package:application/core/constants/icons.dart';
import 'package:flutter/material.dart';

enum DevicePlatform { mobile, desktop }

enum Device {
  unknown,
  ios,
  linux,
  arch,
  mint,
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
      case 'arch':
        return Device.arch;
      case 'mint':
        return Device.mint;
      default:
        return Device.unknown;
    }
  }
  static IconData getDeviceIcon(Device device) {
    switch (device) {
      case Device.ios:
        return MyIcons.apple;
      case Device.android:
        return MyIcons.android;
      case Device.linux:
        return MyIcons.linux;
      case Device.arch:
        return MyIcons.arch;
      case Device.mint:
        return MyIcons.mint;
      case Device.macos:
        return MyIcons.apple;
      case Device.windows:
        return MyIcons.windows11;
      case Device.unknown:
        return Icons.devices;
    }
  }
}
