/*
 * @Author: 刘林
 * @Date: 2021-10-09 11:14:50
 * @LastEditors: 刘林
 * @LastEditTime: 2021-10-09 11:21:20
 */
import 'package:flutter/material.dart';

/// 清除 ListView SingleChildScrollView  GridView 下拉上拉的水波纹效果

class OverflowBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        return child;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return GlowingOverscrollIndicator(
          axisDirection: axisDirection,
          child: child,
          color: Theme.of(context).colorScheme.secondary,
          showTrailing: false, // 不显示尾部水波纹
          showLeading: false, // 不显示首部水波纹
        );
    }
  }
}
