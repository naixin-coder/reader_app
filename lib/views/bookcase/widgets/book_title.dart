/*
 * @Author: 刘林
 * @Date: 2021-10-11 10:17:13
 * @LastEditors: 刘林
 * @LastEditTime: 2021-10-11 10:18:50
 */
import 'package:flutter/material.dart';

class BookTitleWidget extends StatelessWidget {
  final String content;
  const BookTitleWidget(this.content, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: const TextStyle(
        color: Color(0xFF000000),
        fontWeight: FontWeight.w500,
        fontSize: 18.0,
      ),
    );
  }
}
