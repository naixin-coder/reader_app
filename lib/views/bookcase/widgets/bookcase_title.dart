/*
 * @Author: 刘林
 * @Date: 2021-10-08 17:35:35
 * @LastEditors: 刘林
 * @LastEditTime: 2021-10-09 16:02:48
 */
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookCaseTitle extends StatelessWidget {
  const BookCaseTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: IntrinsicHeight(
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: CachedNetworkImage(
                width: 55,
                imageUrl:
                    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fnimg.ws.126.net%2F%3Furl%3Dhttp%253A%252F%252Fdingyue.ws.126.net%252F2021%252F0907%252F76723645j00qz2ckn001gc000hs00qoc.jpg%26thumbnail%3D650x2147483647%26quality%3D80%26type%3Djpg&refer=http%3A%2F%2Fnimg.ws.126.net&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1636270940&t=8b675eae9cc9b49891f1b871a30273df",
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "今日推荐",
                            style: TextStyle(
                              fontSize: 13.0,
                              color: Color(0xFFFF5692),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('签到/领福利'),
                            style: ButtonStyle(
                              shadowColor: MaterialStateProperty.all(
                                  const Color(0xFFFF5692)),
                              overlayColor: MaterialStateProperty.all(
                                  const Color(0xFFFF5692)),
                              tapTargetSize: MaterialTapTargetSize
                                  .shrinkWrap, // 设置点击区域尺寸跟随内容大小
                              minimumSize:
                                  MaterialStateProperty.all(const Size(0, 0)),
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xFFFF5692)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: const BorderSide(
                                          color: Color(0xFFFF5692)))),
                              padding: MaterialStateProperty.all(
                                const EdgeInsets.fromLTRB(15, 7, 15, 7),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      '斗罗大陆-死亡追迹',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Text(
                      '穿越至日本战国时代末期，身份是臭名昭...',
                      style: TextStyle(
                        fontSize: 13.0,
                        color: Color(0xFF8E8E93),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
