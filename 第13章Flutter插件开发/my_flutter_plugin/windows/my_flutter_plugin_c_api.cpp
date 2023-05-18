#include "include/my_flutter_plugin/my_flutter_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "my_flutter_plugin.h"

void MyFlutterPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  my_flutter_plugin::MyFlutterPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
