/*
 * @Author: 刘林
 * @Date: 2021-10-08 13:02:51
 * @LastEditors: 刘林
 * @LastEditTime: 2021-10-18 11:31:06
 */
import 'package:reader_app/widgets/rounded_tab_indicator.dart';
import 'package:flutter/material.dart';

import 'widget/banner.dart';
import 'widget/culling_recommend.dart';

class CullingView extends StatefulWidget {
  const CullingView({Key? key}) : super(key: key);

  @override
  _CullingViewState createState() => _CullingViewState();
}

class _CullingViewState extends State<CullingView>
    with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(length: 4, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: TabBar(
          controller: tabController,
          indicatorSize: TabBarIndicatorSize.label,
          isScrollable: true,
          labelPadding:
              const EdgeInsets.only(top: 25, left: 10, bottom: 20, right: 10),
          indicatorPadding: const EdgeInsets.only(left: 3, right: 3),
          labelColor: const Color(0xFF000000),
          labelStyle:
              const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          unselectedLabelColor: const Color(0xFFB5B5BF),
          unselectedLabelStyle:
              const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          indicator: RoundedTabIndicator(color: const Color(0xFFFF5692)),
          tabs: const [
            Text('精选'),
            Text('同人'),
            Text('纯爱'),
            Text('言情'),
          ],
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
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: const [
            BannerWidget(),
            CullingRecommendWidget(),
            CullingRecommendWidget(),
          ],
        ),
      ),
    );
  }
}
