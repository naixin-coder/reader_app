/*
 * @Author: 刘林
 * @Date: 2021-09-30 21:04:28
 * @LastEditors: 刘林
 * @LastEditTime: 2021-10-19 14:15:44
 */
// import 'package:reader_app/routers/application.dart';
// import 'package:reader_app/routers/routes.dart';
// import 'package:fluro/fluro.dart';
import 'package:reader_app/routers/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class BuguApp extends StatefulWidget {
  const BuguApp({Key? key}) : super(key: key);

  @override
  _BuguAppState createState() => _BuguAppState();
}

class _BuguAppState extends State<BuguApp> {
  String initialRoute = "/";
  String appTitle = "布咕";

  _BuguAppState() {
    // final router = FluroRouter();
    // Routes.configureRoutes(router);
    // Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Color(0xFFFF5692),
          unselectedItemColor: Color(0xFF000000),
          backgroundColor: Color(0xFFFFFFFF),
          elevation: 0.0,
          selectedLabelStyle: TextStyle(fontSize: 10.0),
          unselectedLabelStyle: TextStyle(fontSize: 10.0),
        ),
      ),
    );
    // ScreenUtilInit(
    //   designSize: Size(750, 1334),
    //   builder: () =>
    //   GetMaterialApp.router(
    //     debugShowCheckedModeBanner: false,
    //     title: appTitle,
    //     getPages: AppPages.routes,
    //   ),
    // );
  }
}
