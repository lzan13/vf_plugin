package com.vmloft.develop.library.flutter.vf_plugin;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/**
 * IMPlugin
 */
public class VFPlugin implements MethodCallHandler {
  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    VFCommonPlugin.registerWith(registrar);
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
      result.notImplemented();
  }
}
