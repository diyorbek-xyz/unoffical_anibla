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

  factory Device.fromString(String str) => switch (str) {
    'ios' => Device.ios,
    'android' => Device.android,
    'windows' => Device.windows,
    'macos' => Device.macos,
    'linux' => Device.linux,
    'arch' => Device.arch,
    'mint' => Device.mint,
    _ => Device.unknown,
  };

  IconData get icon => switch (this) {
    ios => MyIcons.apple,
    android => MyIcons.android,
    linux => MyIcons.linux,
    arch => MyIcons.arch,
    mint => MyIcons.mint,
    macos => MyIcons.apple,
    windows => MyIcons.windows11,
    unknown => Icons.devices,
  };
}