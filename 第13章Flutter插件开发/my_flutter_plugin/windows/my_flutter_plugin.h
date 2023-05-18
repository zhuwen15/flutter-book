#ifndef FLUTTER_PLUGIN_MY_FLUTTER_PLUGIN_H_
#define FLUTTER_PLUGIN_MY_FLUTTER_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace my_flutter_plugin {

class MyFlutterPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  MyFlutterPlugin();

  virtual ~MyFlutterPlugin();

  // Disallow copy and assign.
  MyFlutterPlugin(const MyFlutterPlugin&) = delete;
  MyFlutterPlugin& operator=(const MyFlutterPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace my_flutter_plugin

#endif  // FLUTTER_PLUGIN_MY_FLUTTER_PLUGIN_H_
