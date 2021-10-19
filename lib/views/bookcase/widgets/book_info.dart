/*
 * @Author: 刘林
 * @Date: 2021-10-11 10:26:19
 * @LastEditors: 刘林
 * @LastEditTime: 2021-10-11 14:56:33
 */
import 'package:flutter/material.dart';

import 'bookcase_icons.dart';

class BookInfoWidget extends StatefulWidget {
  final String content;
  const BookInfoWidget(this.content, {Key? key}) : super(key: key);

  @override
  _BookInfoWidgetState createState() => _BookInfoWidgetState();
}

class _BookInfoWidgetState extends State<BookInfoWidget> {
  bool showAll = false;
  int showLineNum = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  bookInfo,
                  const SizedBox(
                    width: 10.0,
                  ),
                  const Text(
                    '书籍简介',
                    style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  setState(() {
                    showAll = !showAll;
                    showLineNum = showAll ? 3 : 1;
                  });
                },
                child: showAll ? arrowDown : arrowUp,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 24, 15, 20),
          child: Text(
            widget.content,
            maxLines: showLineNum,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFF585858),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
