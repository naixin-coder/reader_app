/*
 * @Author: 刘林
 * @Date: 2021-10-11 10:56:53
 * @LastEditors: 刘林
 * @LastEditTime: 2021-10-11 14:56:29
 */
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'bookcase_icons.dart';

class BookAppraiseWidget extends StatelessWidget {
  const BookAppraiseWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30.0, bottom: 4),
          child: Row(
            children: [
              appvote,
              const SizedBox(width: 10),
              const Text(
                '书友热评',
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(
                              "https://img0.baidu.com/it/u=1077360284,2857506492&fm=26&fmt=auto"),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          '都是垃圾',
                          style: TextStyle(
                            color: Color(0xFF8E8E93),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.fromLTRB(4, 3, 4, 3),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF5692),
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                          child: const Text(
                            '作者',
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: const [
                        Icon(
                          Icons.hearing_outlined,
                          color: Color(0xFFD8D8E2),
                        ),
                        Text(
                          '6580',
                          style: TextStyle(
                            color: Color(0xFFFF5692),
                            fontSize: 11,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 50,
                    right: 50,
                    bottom: 15,
                  ),
                  child: Text(
                    '帝创业未半而中道崩殂，今天下三分， 益州疲弊，此诚危急存亡之秋也。然侍 卫之臣不懈于内，忠志之士忘身于外者',
                    style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
          itemCount: 3,
        )
      ],
    );
  }
}
