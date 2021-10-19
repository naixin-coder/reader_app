/*
 * @Author: 刘林
 * @Date: 2021-10-08 13:04:36
 * @LastEditors: 刘林
 * @LastEditTime: 2021-10-08 13:07:29
 */
import 'package:flutter/material.dart';

class MeView extends StatefulWidget {
  const MeView({Key? key}) : super(key: key);

  @override
  _MeViewState createState() => _MeViewState();
}

class _MeViewState extends State<MeView> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('我的'),
    );
  }
}
