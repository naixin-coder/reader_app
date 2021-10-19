/*
 * @Author: 刘林
 * @Date: 2021-10-13 17:40:03
 * @LastEditors: 刘林
 * @LastEditTime: 2021-10-14 10:20:31
 */
class Catalog {
  late int id;
  late int index;
  late String title;

  Catalog.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    index = map['index'];
    title = map['title'];
  }
}
