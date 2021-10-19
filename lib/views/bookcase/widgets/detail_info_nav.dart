/*
 * @Author: 刘林
 * @Date: 2021-10-11 10:23:26
 * @LastEditors: 刘林
 * @LastEditTime: 2021-10-11 14:56:40
 */
import 'package:flutter/material.dart';

import 'bookcase_icons.dart';

class BookDetailInfoNavWidget extends StatelessWidget {
  const BookDetailInfoNavWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            const Text(
              '6.8W',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF000000),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                click,
                const Text(
                  '点击',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF8E8E93),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            )
          ],
        ),
        Column(
          children: [
            const Text(
              '1.2W',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF000000),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                collection,
                const Text(
                  '收藏',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF8E8E93),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            )
          ],
        ),
        Column(
          children: [
            const Text(
              '8053',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF000000),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                good,
                const Text(
                  '推荐票',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF8E8E93),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            )
          ],
        ),
        Column(
          children: [
            const Text(
              '495',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF000000),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                earn,
                const Text(
                  '打赏',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF8E8E93),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
