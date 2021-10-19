/*
 * @Author: 刘林
 * @Date: 2021-10-11 09:56:56
 * @LastEditors: 刘林
 * @LastEditTime: 2021-10-13 17:08:38
 */
import 'package:flutter/material.dart';

class TagWidget extends StatelessWidget {
  final String content;
  final EdgeInsetsGeometry padding;
  final BorderRadius? borderRadius;
  final Color color;
  final TextStyle? textStyle;
  final BoxBorder? border;
  const TagWidget(
    this.content, {
    Key? key,
    this.padding = const EdgeInsets.fromLTRB(4, 2, 4, 2),
    this.border,
    this.borderRadius,
    this.color = Colors.white,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        border: border,
        borderRadius: borderRadius ?? BorderRadius.circular(2.0),
      ),
      child: Text(content, style: textStyle),
    );
  }
}
