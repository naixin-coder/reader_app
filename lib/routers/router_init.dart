/*
 * @Author: 刘林
 * @Date: 2021-10-01 05:48:38
 * @LastEditors: 刘林
 * @LastEditTime: 2021-10-01 05:48:39
 */
import 'package:fluro/fluro.dart';

abstract class IRouterProvider {
  void initRouter(FluroRouter fluroRouter);
}
