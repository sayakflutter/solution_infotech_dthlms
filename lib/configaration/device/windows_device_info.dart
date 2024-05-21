import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

import 'package:windows_system_info/windows_system_info.dart';

class ClsDeviceInfo {
  static Future<List<String>> initInfo() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    WindowsDeviceInfo windowsInfo = await deviceInfoPlugin.windowsInfo;

    await WindowsSystemInfo.initWindowsInfo(
        requiredValues: [WindowsSystemInfoFeat.all]);
    if (await WindowsSystemInfo.isInitilized) {}

    // if (kDebugMode) {
    //   print("motherboard uuid id- ${WindowsSystemInfo.os?.uuid.toString()}");
    // }
    // if (kDebugMode) {
    //   print('Windows processer:${WindowsSystemInfo.cpu?.brand.toString()}');
    // }
    // if (kDebugMode) {
    //   print('Type:${Platform.operatingSystem}');
    // }
    // if (kDebugMode) {
    //   print('id:${WindowsSystemInfo.os?.serial.toString()}');
    // }
    // if (kDebugMode) {
    //   print('Windows Version:${WindowsSystemInfo.os?.distro.toString()}');
    // }

    return [
      "${WindowsSystemInfo.os?.uuid.toString()}",
      windowsInfo.deviceId ?? 'Unknown',
      'Type:${Platform.operatingSystem}',
      'id:${WindowsSystemInfo.os?.serial.toString()},${WindowsSystemInfo.os?.distro.toString()},${WindowsSystemInfo.cpu?.brand.toString()}',
    ];
  }
}
