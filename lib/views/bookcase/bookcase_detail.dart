/*
 * @Author: 刘林
 * @Date: 2021-10-09 17:01:06
 * @LastEditors: 刘林
 * @LastEditTime: 2021-10-14 10:41:47
 */
import 'package:reader_app/routers/route.dart' as route;
import 'package:reader_app/utils/overflow_behavior.dart';
import 'package:reader_app/views/bookcase/widgets/bookcase_icons.dart';
import 'package:reader_app/widgets/space.dart';
import 'package:reader_app/widgets/tags.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/book_appraise.dart';
import 'widgets/book_info.dart';
import 'widgets/book_recommend.dart';
import 'widgets/book_title.dart';
import 'widgets/detail_info_nav.dart';

class BookcaseDetailView extends StatelessWidget {
  const BookcaseDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: OverflowBehavior(),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Stack(
                // alignment: Alignment.center,
                children: [
                  Container(
                    height: 135,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        alignment: Alignment(0, 1),
                        image: AssetImage("assets/img/header_bg.png"),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 44,
                    child: SizedBox(
                      // color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            child: back,
                            onTap: () {
                              Get.back();
                            },
                          ),
                          share
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 80),
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 20),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Container(
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
                                width: 93,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 12.0, bottom: 10.0),
                          child: Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.center,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const BookTitleWidget('斗罗大陆-死亡追迹'),
                              Positioned(
                                right: -58,
                                // padding: const EdgeInsets.only(left: 180.0),
                                child: checked,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TagWidget(
                              "本站首发",
                              padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                              color: const Color(0x21FF5692),
                              borderRadius: BorderRadius.circular(2.0),
                              textStyle: const TextStyle(
                                color: Color(0xFFFF5692),
                                fontSize: 11.0,
                                fontWeight: FontWeight.w500,
                                fontFamily: "PingFang Bold",
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 7.0),
                              child: TagWidget(
                                "免费",
                                padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                color: const Color(0x2118D275),
                                borderRadius: BorderRadius.circular(2.0),
                                textStyle: const TextStyle(
                                  color: Color(0xFF18D275),
                                  fontSize: 11.0,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "PingFang Bold",
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 18),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                '45.6万字',
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
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: BookDetailInfoNavWidget(),
                        ),
                        const BookInfoWidget(
                          "普通打工仔楚洛，偶得三界打工人系统！ 李白吟诗想喝酒？好办！飞天茅台走起！任务奖励，龙泉匕首、靠山符！ 通天教主最近感觉很烦？ 有点难搞哦？什么？送我八九玄功？！那……肥宅快乐水配华子。",
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 24, 15, 20),
                          child: Row(
                            children: [
                              TagWidget(
                                "小说同人",
                                padding:
                                    const EdgeInsets.fromLTRB(10, 9, 10, 9),
                                color: const Color(0x215A6DFF),
                                borderRadius: BorderRadius.circular(15.0),
                                textStyle: const TextStyle(
                                  color: Color(0xFF5A6DFF),
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "PingFang Bold",
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              TagWidget(
                                "啊呸",
                                padding:
                                    const EdgeInsets.fromLTRB(10, 9, 10, 9),
                                color: const Color(0x218E8E93),
                                borderRadius: BorderRadius.circular(15.0),
                                textStyle: const TextStyle(
                                  color: Color(0xFF8E8E93),
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "PingFang Bold",
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              TagWidget(
                                "妈妈咪",
                                padding:
                                    const EdgeInsets.fromLTRB(10, 9, 10, 9),
                                color: const Color(0x218E8E93),
                                borderRadius: BorderRadius.circular(15.0),
                                textStyle: const TextStyle(
                                  color: Color(0xFF8E8E93),
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "PingFang Bold",
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            Get.rootDelegate.toNamed(route.Route.reader);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  newPng,
                                  const Text(
                                    '第七十二章：公平的切磋',
                                    style: TextStyle(
                                      color: Color(0xFF000000),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    '昨天',
                                    style: TextStyle(
                                      color: Color(0xFFFF5692),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  arrow,
                                ],
                              )
                            ],
                          ),
                        ),
                        const Divider(),
                        const BookAppraiseWidget(),
                        const Divider(),
                        const BookRecommendWidget()
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 15,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0.0),
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xFFFFEEF4)),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.fromLTRB(18, 10, 18, 10),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22.0),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: const SpaceWidget(
                        size: 5,
                        children: [
                          Icon(
                            Icons.add,
                            color: Color(0xFFFF5692),
                          ),
                          Text(
                            '加入书架',
                            style: TextStyle(
                              color: Color(0xFFFF5692),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(8.0),
                        backgroundColor: MaterialStateProperty.all(
                          const Color(0xFFFF5692),
                        ),
                        shadowColor: MaterialStateProperty.all(
                          const Color(0xFFFF5692),
                        ),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.fromLTRB(65, 10, 65, 10),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius:
                                BorderRadiusDirectional.circular(22.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Get.rootDelegate.toNamed(route.Route.reader);
                      },
                      child: const SpaceWidget(
                        size: 5,
                        children: [
                          Icon(Icons.book),
                          Text('开始阅读'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// 重构前 634


