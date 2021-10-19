/*
 * @Author: 刘林
 * @Date: 2021-10-02 15:37:35
 * @LastEditors: 刘林
 * @LastEditTime: 2021-10-02 15:42:16
 */
import 'package:shared_preferences/shared_preferences.dart';

Future<Object?> getStorageItem(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.get(key);
}

Future<void> setStorageItem(String key, String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}

Future<void> deleteStorageItem(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove(key);
}
