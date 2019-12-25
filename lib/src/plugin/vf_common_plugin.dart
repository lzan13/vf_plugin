import 'dart:async';
import 'package:flutter/services.dart';

const MethodChannel mChannel =
    MethodChannel("com.vmloft.develop.library.flutter.plugin.vf_common_plugin");

class VFCommonPlugin {
  /// 获取数据
  static Future<dynamic> loadData() async {
    return await mChannel.invokeMethod("loadData", null);
  }

  /// 点击回调 Flutter -> Native
  static Future<void> openNativePage(Map<String, Object> params) async {
    await mChannel.invokeMethod("putData", params);
  }
}
