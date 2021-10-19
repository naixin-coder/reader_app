/*
 * @Author: 刘林
 * @Date: 2021-10-13 09:57:26
 * @LastEditors: 刘林
 * @LastEditTime: 2021-10-13 10:32:02
 */
import 'package:flutter/material.dart';

enum SpaceDirection { vertical, horizontal }

class SpaceWidget extends StatelessWidget {
  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final SpaceDirection direction;
  final double size;
  const SpaceWidget({
    required this.children,
    Key? key,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.direction = SpaceDirection.horizontal,
    this.size = 10.0,
  }) : super(key: key);

  Widget _buildVerticalWidget() {
    List<Widget> newChildrenWidgets = [];
    for (int i = 0; i < children.length; i++) {
      newChildrenWidgets.add(children[i]);
      if (i <= children.length - 1) {
        newChildrenWidgets.add(SizedBox(
          height: size,
        ));
      }
    }
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      children: newChildrenWidgets,
    );
  }

  Widget _buildHorizontalWidget() {
    List<Widget> newChildrenWidgets = [];
    for (int i = 0; i < children.length; i++) {
      newChildrenWidgets.add(children[i]);
      if (i <= children.length - 1) {
        newChildrenWidgets.add(SizedBox(
          width: size,
        ));
      }
    }
    return Row(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      children: newChildrenWidgets,
    );
  }

  @override
  Widget build(BuildContext context) {
    return direction == SpaceDirection.horizontal
        ? _buildHorizontalWidget()
        : _buildVerticalWidget();
  }
}
