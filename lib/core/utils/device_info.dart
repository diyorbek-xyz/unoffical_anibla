import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfo {
  final String platformOS;
  final String platform;
  final String name;
  const DeviceInfo({required this.name, required this.platform, required this.platformOS});
  static Future<DeviceInfo> getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    late DeviceInfo device;
    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        device = DeviceInfo(
          platform: "mobile",
          name: "${androidInfo.name} ${androidInfo.model}",
          platformOS: "android",
        );
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        device = DeviceInfo(
          name: "${iosInfo.name} ${iosInfo.model}",
          platformOS: "ios",
          platform: "mobile",
        );
      } else if (Platform.isLinux) {
        LinuxDeviceInfo linuxDeviceInfo = await deviceInfo.linuxInfo;
        device = DeviceInfo(
          name: linuxDeviceInfo.prettyName,
          platformOS: linuxDeviceInfo.id,
          platform: "desktop",
        );
      } else if (Platform.isMacOS) {
        MacOsDeviceInfo macOsDeviceInfo = await deviceInfo.macOsInfo;
        device = DeviceInfo(
          name: macOsDeviceInfo.modelName,
          platformOS: "macos",
          platform: "desktop",
        );
      } else if (Platform.isWindows) {
        WindowsDeviceInfo windowsDeviceInfo = await deviceInfo.windowsInfo;
        device = DeviceInfo(
          name: windowsDeviceInfo.productName,
          platformOS: "windows",
          platform: "desktop",
        );
      } else {
        device = DeviceInfo(name: "Nomalum qurilma", platformOS: "unknown", platform: "unknown");
      }
    } catch (e) {
      device = DeviceInfo(name: "Nomalum qurilma", platformOS: "unknown", platform: "unknown");
    }
    return device;
  }
}
