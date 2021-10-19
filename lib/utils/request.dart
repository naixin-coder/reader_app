/*
 * @Author: 刘林
 * @Date: 2021-10-01 06:20:22
 * @LastEditors: 刘林
 * @LastEditTime: 2021-10-12 10:42:43
 */
import 'dart:convert';

import 'package:reader_app/app.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:fluttertoast/fluttertoast.dart';

class Request {
  static final Dio _dio = Dio();
  static final context = navigatorKey.currentState!.overlay!.context;
  static final Map<int, String> _errorInfo = {
    200: '服务器成功返回请求的数据。',
    201: '新建或修改数据成功。',
    202: '一个请求已经进入后台排队（异步任务）。',
    204: '删除数据成功。',
    400: '发出的请求有错误，服务器没有进行新建或修改数据的操作。',
    401: '用户没有权限（令牌、用户名、密码错误）。',
    403: '用户得到授权，但是访问是被禁止的。',
    404: '发出的请求针对的是不存在的记录，服务器没有进行操作。',
    406: '请求的格式不可得。',
    410: '请求的资源被永久删除，且不会再得到的。',
    422: '当创建一个对象时，发生一个验证错误。',
    500: '服务器发生错误，请检查服务器。',
    502: '网关错误。',
    503: '服务不可用，服务器暂时过载或维护。',
    504: '网关超时。',
  };

  void httpInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(onError: (DioError e, handler) {
      if (e.response!.statusCode == 401) {
        //401 单独处理
      }
      Fluttertoast.showToast(
          msg: _errorInfo[e.response!.statusCode].toString());
      return handler.next(e);
    }));
  }

  Future get(String url, [Map<String, dynamic> params = const {}]) async {
    Response response = await _dio.get(url, queryParameters: params);
    httpInterceptors();
    return response;
  }

  Future post(String url, [Map<String, dynamic> params = const {}]) async {
    Response response = await _dio.post(url, data: params);
    httpInterceptors();
    return response;
  }

  static Future<dynamic> mock(String action, {Map param = const {}}) async {
    var responseStr = await rootBundle.loadString('mock/$action.json');
    var responseJson = json.decode(responseStr);
    // print(responseJson);
    return responseJson['data'];
  }
}
