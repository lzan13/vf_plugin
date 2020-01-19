import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'package:vf_plugin/vf_plugin.dart';

import 'package:vf_plugin_example/request/api.dart';

final Http http = Http();

class Http extends BaseHttp {
  @override
  void init() {
    options.baseUrl = 'https://melove.net/api/v1.0';
    interceptors..add(ApiInterceptor());
  }
}

///
/// 请求结果拦截器
class ApiInterceptor extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async {
    debugPrint(
        '->api-> ${options.baseUrl}${options.path} ->params->${options.queryParameters}');
    return options;
  }

  @override
  onResponse(Response response) {
    debugPrint('-api-response-> ${response.data}');
    // 普通的 json 结果处理
    Result result = Result.fromJson(response.data);
    if (result.success) {
      response.data = result.data;
      return http.resolve(response);
    } else {
      throw FailException.fromRespData(result);
    }
  }
}

class Result extends BaseResult {
  bool get success => 0 == code;

  Result.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'];
  }
}
