/*
 * @Author: 刘林
 * @Date: 2021-10-18 11:12:47
 * @LastEditors: 刘林
 * @LastEditTime: 2021-10-18 11:28:56
 */
import 'package:reader_app/views/bookcase/widgets/book_card.dart';
import 'package:reader_app/widgets/space.dart';
import 'package:flutter/material.dart';

class CullingRecommendWidget extends StatelessWidget {
  const CullingRecommendWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: SpaceWidget(
        direction: SpaceDirection.vertical,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                '编辑强推',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SpaceWidget(
                size: 2,
                children: [
                  Text(
                    '更多',
                    style: TextStyle(
                      color: Color(0xFFB5B5BF),
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 18,
                    color: Color(0xFFB5B5BF),
                  ),
                ],
              )
            ],
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 8,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              childAspectRatio: 186 / 415,
            ),
            itemBuilder: (BuildContext context, int index) {
              return const BookCard();
            },
          ),
        ],
      ),
    );
  }
}
