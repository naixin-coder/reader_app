/*
 * @Author: 刘林
 * @Date: 2021-09-30 21:00:46
 * @LastEditors: 刘林
 * @LastEditTime: 2021-10-19 14:13:42
 */
import 'dart:io';

import 'package:reader_app/app.dart';
// import 'package:reader_app/views/tests/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const BuguApp());
  // runApp(const GetMaterialApp(home: TestView()));
  if (Platform.isAndroid) {
    //设置状态栏颜色
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //设置为透明
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}
