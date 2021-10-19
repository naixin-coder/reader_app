/*
 * @Author: 刘林
 * @Date: 2021-10-11 10:59:57
 * @LastEditors: 刘林
 * @LastEditTime: 2021-10-11 14:56:24
 */
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'bookcase_icons.dart';

class BookRecommendWidget extends StatelessWidget {
  const BookRecommendWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            goodSelected,
            const Text(
              '同类推荐',
              style: TextStyle(
                color: Color(0xFF000000),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                width: double.infinity,
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            top: 4.0, left: 7.0, right: 7.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 4),
                              color: Color(0xFFE2E2E2),
                              spreadRadius: 2.0,
                              blurRadius: 7.0,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4.0),
                          child: CachedNetworkImage(
                            imageUrl:
                                "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201308%2F24%2F115056yn0krw0u0duwkddb.jpg&refer=http%3A%2F%2Fattach.bbs.miui.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1636338554&t=4f55518f615b2262f10d0f07b439547f",
                            width: 75,
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text('斗罗大陆-死亡追迹'),
                                  Text('小说同人'),
                                ],
                              ),
                              const Text(
                                '穿越至日本战国时代末期，身份是臭名昭著的 山贼，不远处就是苇名城。虽是山贼...',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    '连载中',
                                    style: TextStyle(
                                      color: Color(0xFFB5B5BF),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    child: Text(
                                      '.',
                                      style: TextStyle(
                                        color: Color(0xFFB5B5BF),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '7.3万人在看',
                                    style: TextStyle(
                                      color: Color(0xFFB5B5BF),
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
