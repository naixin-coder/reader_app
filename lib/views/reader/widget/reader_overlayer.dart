/*
 * @Author: 刘林
 * @Date: 2021-10-12 10:53:32
 * @LastEditors: 刘林
 * @LastEditTime: 2021-10-12 17:17:26
 */
import 'package:reader_app/models/acticle.dart';
import 'package:reader_app/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'battery_view.dart';

class ReaderOverlayer extends StatelessWidget {
  final Article article;
  final int page;
  final double topSafeHeight;

  const ReaderOverlayer(
      {required this.article,
      required this.page,
      required this.topSafeHeight,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var format = DateFormat('HH:mm');
    var time = format.format(DateTime.now());

    return Container(
      padding: EdgeInsets.fromLTRB(
          15, 37 + topSafeHeight, 15, 10 + Screen.bottomSafeHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(article.title.toString(),
              style: const TextStyle(fontSize: 14, color: Colors.black45)),
          Expanded(child: Container()),
          Row(
            children: <Widget>[
              const BatteryView(),
              const SizedBox(width: 10),
              Text(time,
                  style: const TextStyle(fontSize: 11, color: Colors.black45)),
              Expanded(child: Container()),
              Text('第${page + 1}页',
                  style: const TextStyle(fontSize: 11, color: Colors.black45)),
            ],
          ),
        ],
      ),
    );
  }
}
