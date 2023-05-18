
import 'my_flutter_plugin_platform_interface.dart';

class MyFlutterPlugin {
  Future<String?> getPlatformVersion() {
    return MyFlutterPluginPlatform.instance.getPlatformVersion();
  }

  Future<String?> getAppVersion() {
    return MyFlutterPluginPlatform.instance.getAppVersion();
  }
}
