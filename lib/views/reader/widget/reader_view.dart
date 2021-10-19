/*
 * @Author: 刘林
 * @Date: 2021-10-12 10:51:33
 * @LastEditors: 刘林
 * @LastEditTime: 2021-10-12 17:28:49
 */
import 'package:reader_app/models/acticle.dart';
import 'package:reader_app/utils/screen.dart';
import 'package:flutter/material.dart';

import 'reader_overlayer.dart';

class ReaderContentView extends StatelessWidget {
  final Article article;
  final int page;
  final double topSafeHeight;

  const ReaderContentView(
      {required this.article,
      required this.page,
      required this.topSafeHeight,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
            left: 0,
            top: 0,
            right: 0,
            bottom: 0,
            child: Image.asset('assets/img/read_bg.png', fit: BoxFit.cover)),
        ReaderOverlayer(
            article: article, page: page, topSafeHeight: topSafeHeight),
        buildContent(article, page),
      ],
    );
  }

  buildContent(Article article, int page) {
    var content = article.stringAtPageIndex(page);

    if (content.startsWith('\n')) {
      content = content.substring(1);
    }
    return Container(
      color: Colors.transparent,
      margin: EdgeInsets.fromLTRB(
          15, topSafeHeight + 67, 10, Screen.bottomSafeHeight + 27),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: content, style: const TextStyle(fontSize: 20))
          ],
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
