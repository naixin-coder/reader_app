/*
 * @Author: 刘林
 * @Date: 2021-10-09 10:41:06
 * @LastEditors: 刘林
 * @LastEditTime: 2021-10-09 17:03:57
 */
import 'package:reader_app/routers/route.dart' as route;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookCard extends StatelessWidget {
  const BookCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => Get.rootDelegate.toNamed(route.Route.bookcaseDetail),
          child: Container(
            margin: const EdgeInsets.only(top: 4.0, left: 7.0, right: 7.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 4),
                  color: Color(0xFFE4E5E9),
                  spreadRadius: 4.0,
                  blurRadius: 4.0,
                ),
              ],
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: CachedNetworkImage(
                      imageUrl:
                          "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201308%2F24%2F115056yn0krw0u0duwkddb.jpg&refer=http%3A%2F%2Fattach.bbs.miui.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1636338554&t=4f55518f615b2262f10d0f07b439547f"),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(4, 3, 4, 3),
                    decoration: const BoxDecoration(
                      color: Color(0xFF434560),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(4.0),
                        bottomLeft: Radius.circular(4.0),
                      ),
                    ),
                    child: const Text(
                      '完结',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 18.0, left: 7.0, right: 7.0),
          child: Text(
            "斗罗大陆-死亡追迹",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Color(0xFF000000),
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10.0, left: 7.0, right: 7.0),
          child: Text(
            "未读过",
            style: TextStyle(
              color: Color(0xFF8E8E93),
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
