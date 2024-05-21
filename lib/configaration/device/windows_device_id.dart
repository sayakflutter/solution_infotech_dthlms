import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:device_meta/device_meta.dart';
import 'package:windows_system_info/windows_system_info.dart';

class ClsDeviceInfo {
  static Future<List<String>> initInfo() async {
    DeviceMeta deviceMeta = DeviceMeta.instance;

    await WindowsSystemInfo.initWindowsInfo(
        requiredValues: [WindowsSystemInfoFeat.all]);
    if (await WindowsSystemInfo.isInitilized) {}

    print("motherboard uuid id- ${WindowsSystemInfo.os?.uuid.toString()}");
    print('Windows processer:${WindowsSystemInfo.cpu?.brand.toString()}');
    print('Type:${Platform.operatingSystem}');
    print('id:${WindowsSystemInfo.os?.serial.toString()}');
    print('Windows Version:${WindowsSystemInfo.os?.distro.toString()}');

    return [
      "motherboard uuid id- ${WindowsSystemInfo.os?.uuid.toString()}",
      'Windows processer:${WindowsSystemInfo.cpu?.brand.toString()}',
      'Type:${Platform.operatingSystem}',
      'id:${WindowsSystemInfo.os?.serial.toString()}',
      'Windows Version:${WindowsSystemInfo.os?.distro.toString()}'
    ];
  }
}
