import 'package:package_info_plus/package_info_plus.dart';

class Package {
  static late PackageInfo packageInfo;

  static Future<void> setPackageInfo() async => packageInfo = await PackageInfo.fromPlatform();
}