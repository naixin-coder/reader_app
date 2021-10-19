/*
 * @Author: 刘林
 * @Date: 2021-10-13 11:11:09
 * @LastEditors: 刘林
 * @LastEditTime: 2021-10-14 10:38:58
 */
import 'package:reader_app/models/catalog.dart';
import 'package:reader_app/widgets/space.dart';
import 'package:reader_app/widgets/tags.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'reader_icons.dart';

class ReaderMenuView extends StatefulWidget {
  final List<Catalog> catalogList;
  final VoidCallback hideMenu;
  final void Function(Catalog catalog) onToggleChapter;
  const ReaderMenuView({
    required this.catalogList,
    Key? key,
    required this.hideMenu,
    required this.onToggleChapter,
  }) : super(key: key);

  @override
  _ReaderMenuViewState createState() => _ReaderMenuViewState();
}

class _ReaderMenuViewState extends State<ReaderMenuView>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  double sliderValue = 0;

  bool menuShow = false;
  bool menuReverse = false;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(animationController);
    animation.addListener(() {
      setState(() {});
    });
    animationController.forward();
    super.initState();
  }

  _buildTopContent() {
    return Positioned(
      top: -((1 - animation.value) * 68),
      left: 0,
      child: Container(
        color: Colors.white,
        height: 68,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 28),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back),
            ),
            IconButton(onPressed: () {}, icon: download),
          ],
        ),
      ),
    );
  }

  _buildBottomContent() {
    return Positioned(
      bottom: -((1 - animation.value) * 182),
      left: 0,
      child: Container(
        height: 182,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(15, 30, 15, 30),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
        ),
        child: Column(children: [
          SpaceWidget(
            children: [
              const Text(
                '上一章',
                style: TextStyle(
                  color: Color(
                    0xFF000000,
                  ),
                  fontWeight: FontWeight.w500,
                ),
              ),
              Expanded(
                child: Slider(
                  value: sliderValue,
                  activeColor: const Color(0xFFF2F3F8),
                  inactiveColor: const Color(0xFFF2F3F8),
                  thumbColor: const Color(0xFFFF5692),
                  onChanged: (value) {
                    setState(() {
                      sliderValue = value;
                    });
                  },
                ),
              ),
              const Text(
                '下一章',
                style: TextStyle(
                  color: Color(
                    0xFF000000,
                  ),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          // const SizedBox(
          //   height: 20,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  animationController.reverse();
                  setState(() {
                    menuShow = true;
                  });
                },
                child: const SpaceWidget(
                  direction: SpaceDirection.vertical,
                  children: [
                    Icon(
                      Icons.list_rounded,
                      size: 32,
                    ),
                    Text(
                      '目录',
                      style: TextStyle(
                        color: Color(
                          0xFF000000,
                        ),
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              const SpaceWidget(
                direction: SpaceDirection.vertical,
                children: [
                  Icon(
                    Icons.g_mobiledata_outlined,
                    size: 32,
                  ),
                  Text(
                    '书友圈',
                    style: TextStyle(
                      color: Color(
                        0xFF000000,
                      ),
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              const SpaceWidget(
                direction: SpaceDirection.vertical,
                children: [
                  Icon(
                    Icons.mode_night_outlined,
                    size: 32,
                  ),
                  Text(
                    '夜间',
                    style: TextStyle(
                      color: Color(
                        0xFF000000,
                      ),
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              const SpaceWidget(
                direction: SpaceDirection.vertical,
                children: [
                  Icon(
                    Icons.linear_scale_rounded,
                    size: 32,
                  ),
                  Text(
                    '设置',
                    style: TextStyle(
                      color: Color(
                        0xFF000000,
                      ),
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ],
          )
        ]),
      ),
    );
  }

  _buildMenuContent() {
    if (!menuShow) {
      return Container();
    }
    return Positioned(
      top: 0,
      left: -(MediaQuery.of(context).size.width * 0.72) * animation.value,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.72,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(15, 50, 15, 25),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SpaceWidget(
            crossAxisAlignment: CrossAxisAlignment.start,
            direction: SpaceDirection.vertical,
            children: [
              const Text(
                '睡服导演后',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SpaceWidget(
                    size: 5,
                    children: [
                      const Text(
                        '连载中',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF8E8E93),
                        ),
                      ),
                      Text(
                        '共${widget.catalogList.length}章',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF8E8E93),
                        ),
                      ),
                    ],
                  ),
                  SpaceWidget(
                    children: [
                      const Text(
                        '正序',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF8E8E93),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              menuReverse = !menuReverse;
                            });
                          },
                          icon: Icon(
                            !menuReverse
                                ? Icons.upload_sharp
                                : Icons.download_sharp,
                            size: 18,
                            color: const Color(0xFF8E8E93),
                          )),
                    ],
                    size: 0,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  )
                ],
              ),
              ListView.separated(
                shrinkWrap: true,
                reverse: menuReverse,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      widget.onToggleChapter(widget.catalogList[index]);
                      widget.hideMenu();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.catalogList[index].title),
                        const TagWidget(
                          "免费",
                          color: Color(0x2118D275),
                          textStyle: TextStyle(
                            color: Color(0xFF18D275),
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
                itemCount: widget.catalogList.length,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTapDown: (_) async {
            await animationController.reverse();
            widget.hideMenu();
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black26,
          ),
        ),
        _buildTopContent(),
        _buildBottomContent(),
        _buildMenuContent(),
      ],
    );
  }
}
