import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

import 'package:windows_system_info/windows_system_info.dart';

class ClsDeviceInfo {
  static Future<List<String>> windowsInfo() async {
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
      windowsInfo.deviceId,
      'Type:${Platform.operatingSystem}',
      'id:${WindowsSystemInfo.os?.serial.toString()},${WindowsSystemInfo.os?.distro.toString()},${WindowsSystemInfo.cpu?.brand.toString()}',
    ];
  }

  static Future<void> androidInfo() async {
    DeviceInfoPlugin android = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      var info = await android.androidInfo;
      // DeviceNmae=info.model;
      print("brand--" + info.brand);

      print("id--" + info.id);
      print("board--" + info.board);
      print("version--" + info.version.release);
      print("type--" + info.type);
      print("model--" + info.model);

      print(info.supported32BitAbis);
      print(info.supported64BitAbis);
      print(info.supportedAbis);
      print(info.systemFeatures);
      print(info.data);
    }
  }
}
