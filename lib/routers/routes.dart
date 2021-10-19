/*
 * @Author: 刘林
 * @Date: 2021-10-01 05:49:32
 * @LastEditors: 刘林
 * @LastEditTime: 2021-10-11 16:07:56
 */
import 'package:reader_app/routers/router_init.dart';
import 'package:reader_app/views/home/home.dart';
import 'package:reader_app/views/not_found.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

var homeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> parameters) {
  return const HomeView();
});

class Routes {
  static final List<IRouterProvider> _listRouter = [];
  static String home = "/";

  static void configureRoutes(FluroRouter fluroRouter) {
    fluroRouter.notFoundHandler = Handler(handlerFunc: (_, __) {
      return const NotFoundView();
    });
    fluroRouter.define(home, handler: homeHandler);
    //初始化路由
    for (var routerProvider in _listRouter) {
      routerProvider.initRouter(fluroRouter);
    }
  }
}
