/*
 * @Author: 刘林
 * @Date: 2021-10-08 13:04:08
 * @LastEditors: 刘林
 * @LastEditTime: 2021-10-14 15:08:46
 */
import 'package:reader_app/utils/overflow_behavior.dart';
import 'package:reader_app/widgets/space.dart';
import 'package:reader_app/widgets/tags.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BookstoreView extends StatefulWidget {
  const BookstoreView({Key? key}) : super(key: key);

  @override
  _BookstoreViewState createState() => _BookstoreViewState();
}

class _BookstoreViewState extends State<BookstoreView>
    with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(length: 3, vsync: this);

  @override
  void initState() {
    super.initState();
    // tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 35,
          left: 47,
          child: Image.asset(
            "assets/img/bookstore_bg1.png",
            width: 23,
          ),
        ),
        Positioned(
          top: -100,
          right: -100,
          child: Image.asset(
            "assets/img/bookstore_bg2.png",
            width: 300,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: const Text(
              '书库',
              style: TextStyle(
                fontFamily: 'PingFang Bold',
                color: Color(0xFF000000),
                fontSize: 23.0,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search_rounded,
                  color: Color(0xFF000000),
                ),
              )
            ],
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(28.0),
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: SpaceWidget(
                  size: 20,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '同人',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFFF5692),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '纯爱',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFB5B5BF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '言情',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFB5B5BF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: ScrollConfiguration(
            behavior: OverflowBehavior(),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 20),
              child: Column(
                children: [
                  SpaceWidget(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TagWidget(
                        '影视',
                        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                        borderRadius: BorderRadius.circular(16),
                        color: const Color(0x21FF5692),
                        textStyle: const TextStyle(
                          color: Color(0xFFFF5692),
                          fontSize: 13,
                        ),
                      ),
                      TagWidget(
                        '动漫',
                        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                        borderRadius: BorderRadius.circular(16),
                        color: const Color(0xFFF8F8F8),
                        textStyle: const TextStyle(
                          color: Color(0xFF8E8E93),
                          fontSize: 13,
                        ),
                      ),
                      TagWidget(
                        '人物',
                        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                        borderRadius: BorderRadius.circular(16),
                        color: const Color(0xFFF8F8F8),
                        textStyle: const TextStyle(
                          color: Color(0xFF8E8E93),
                          fontSize: 13,
                        ),
                      ),
                      TagWidget(
                        '小说',
                        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                        borderRadius: BorderRadius.circular(16),
                        color: const Color(0xFFF8F8F8),
                        textStyle: const TextStyle(
                          color: Color(0xFF8E8E93),
                          fontSize: 13,
                        ),
                      ),
                      TagWidget(
                        '游戏',
                        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                        borderRadius: BorderRadius.circular(16),
                        color: const Color(0xFFF8F8F8),
                        textStyle: const TextStyle(
                          color: Color(0xFF8E8E93),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: double.infinity,
                        child: IntrinsicHeight(
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4.0),
                                child: CachedNetworkImage(
                                  width: 75,
                                  imageUrl:
                                      "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic1.win4000.com%2Fmobile%2Fd%2F5580ea324847f.jpg&refer=http%3A%2F%2Fpic1.win4000.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1636787114&t=89e365b1bf3e03a482cc1d39d904d249",
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: double.infinity,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              '斗罗大陆-死亡追迹',
                                              style: TextStyle(
                                                fontSize: 15.0,
                                                color: Color(0xFF000000),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            TagWidget(
                                              '小说同人',
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      5, 3, 5, 3),
                                              textStyle: const TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF5A6DFF),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                              color: const Color(0xFFEBF0FF),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Text(
                                        '穿越至日本战国时代末期，身份是臭名昭...穿越至日本战国时代末期，身份是臭名昭...穿越至日本战国时代末期，身份是臭名昭...',
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          color: Color(0xFF8E8E93),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const Text(
                                        '连载中',
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
                    },
                    itemCount: 20,
                  ),
                ],
              ),
            ),
          ),
          // body: ListView.separated(
          //   separatorBuilder: (BuildContext context, int index) {
          //     return const Divider();
          //   },
          //   itemBuilder: (BuildContext context, int index) {
          //     return Container(
          //       height: 100,
          //       width: 100,
          //       color: Colors.yellowAccent,
          //     );
          //   },
          //   itemCount: 20,
          // ),
        ),
      ],
    );
  }
}
