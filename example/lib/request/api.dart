import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter/foundation.dart';

import 'package:vf_plugin/vf_plugin.dart';

// 必须是顶层函数
_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

abstract class BaseHttp extends DioForNative {
  BaseHttp() {
    /// 初始化 加入通用处理
    (transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
    interceptors..add(HeaderInterceptor());
    init();
  }

  void init();
}

///
/// 添加 Header
///
class HeaderInterceptor extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async {
    options.connectTimeout = 30 * 1000;
    options.receiveTimeout = 30 * 1000;

    var appVersion = await VFPlatform.getAppVersion();
    // var version = Map()
    //   ..addAll({
    //     'app_verison': appVersion,
    //   });
    options.headers['version'] = appVersion;
    options.headers['platform'] = Platform.operatingSystem;
    return options;
  }
}

///
/// error统一处理
///
void formatError(DioError e) {
  String error = '';
  if (e.type == DioErrorType.CONNECT_TIMEOUT) {
    // It occurs when url is opened timeout.
    error = '连接超时 ${e.error}';
  } else if (e.type == DioErrorType.SEND_TIMEOUT) {
    // It occurs when url is sent timeout.
    error = '请求超时 ${e.error}';
  } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
    //It occurs when receiving timeout
    error = '响应超时 ${e.error}';
  } else if (e.type == DioErrorType.RESPONSE) {
    // When the server response, but with a incorrect status, such as 404, 503...
    error = '响应错误 ${e.error}';
  } else if (e.type == DioErrorType.CANCEL) {
    // When the request is cancelled, dio will throw a error with this type.
    error = '请求取消 ${e.error}';
  } else {
    //DEFAULT Default error type, Some other Error. In this case, you can read the DioError.error if it is not null.
    error = '未知错误 ${e.error}';
  }
  VFLog.e('请求失败: $error');
}

///
/// 请求结果基类，一般接口定义方式，按需使用
///
abstract class BaseResult {
  int code = 0;
  String msg;
  dynamic data;

  bool get success;

  BaseResult({this.code, this.msg, this.data});

  @override
  String toString() {
    return 'result:{code: $code, msg: $msg, data: $data}';
  }
}

///
/// 接口返回失败
///
class FailException implements Exception {
  int code;
  String msg;

  FailException.fromRespData(BaseResult result) {
    code = result.code;
    msg = result.msg;
  }

  @override
  String toString() {
    return 'FailException: {code: $code, msg: $msg}';
  }
}
