/*
 * @Author: 刘林
 * @Date: 2021-10-01 06:59:25
 * @LastEditors: 刘林
 * @LastEditTime: 2021-10-08 13:13:09
 */
import 'package:reader_app/utils/util.dart';
import 'package:reader_app/views/bookcase/bookcase.dart';
import 'package:reader_app/views/bookstore/bookstore.dart';
import 'package:reader_app/views/culling/culling.dart';
import 'package:reader_app/views/me/me.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bottom_icons.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _lastClickTime = 0;
  int _activeIndex = 0;

  List<Widget> viewList = <Widget>[
    const BookcaseView(),
    const CullingView(),
    const BookstoreView(),
    const MeView()
  ];

  Future<bool> _doubleExit() {
    int nowTime = DateTime.now().microsecondsSinceEpoch;
    if (_lastClickTime != 0 && nowTime - _lastClickTime > 2000) {
      return Future.value(true);
    } else {
      _lastClickTime = DateTime.now().microsecondsSinceEpoch;
      showToast("再按一次退出应用");
      Future.delayed(const Duration(milliseconds: 2000), () {
        _lastClickTime = 0;
      });
      return Future.value(false);
    }
  }

  List<BottomNavigationBarItem> _buildTabBar() {
    return [
      BottomNavigationBarItem(
          icon: bookcase,
          activeIcon: bookcaseSelected,
          backgroundColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          label: '书架'),
      BottomNavigationBarItem(
          icon: culling,
          activeIcon: cullingSelected,
          backgroundColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          label: '精选'),
      BottomNavigationBarItem(
          icon: bookstore,
          activeIcon: bookstoreSelected,
          backgroundColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          label: '书库'),
      BottomNavigationBarItem(
          icon: me,
          activeIcon: meSelected,
          backgroundColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          label: '我的'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _doubleExit,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: viewList[_activeIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _activeIndex,
          elevation: Theme.of(context).bottomNavigationBarTheme.elevation,
          backgroundColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          selectedItemColor:
              Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          unselectedItemColor:
              Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
          items: _buildTabBar(),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle:
              Theme.of(context).bottomNavigationBarTheme.selectedLabelStyle,
          unselectedLabelStyle:
              Theme.of(context).bottomNavigationBarTheme.unselectedLabelStyle,
          onTap: (index) => setState(() {
            _activeIndex = index;
          }),
        ),
      ),
    );
  }
}
