/*
 * @Author: 刘林
 * @Date: 2021-10-02 15:28:11
 * @LastEditors: 刘林
 * @LastEditTime: 2021-10-02 15:30:31
 */
import 'package:fluttertoast/fluttertoast.dart';

void showToast(String msg, {ToastGravity gravity = ToastGravity.BOTTOM}) {
  Fluttertoast.showToast(msg: msg, gravity: gravity);
}
