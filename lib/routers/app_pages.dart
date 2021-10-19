/*
 * @Author: 刘林
 * @Date: 2021-10-03 09:54:03
 * @LastEditors: 刘林
 * @LastEditTime: 2021-10-12 16:58:24
 */
import 'package:reader_app/routers/route.dart';
import 'package:reader_app/views/bookcase/bookcase_detail.dart';
import 'package:reader_app/views/bookcase/bookcase_edit.dart';
import 'package:reader_app/views/home/home.dart';
import 'package:reader_app/views/reader/reader.dart';
import 'package:get/route_manager.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Route.root,
      page: () => const HomeView(),
      children: [
        GetPage(
          name: Route.bookcaseEdit,
          page: () => const BookcaseEditView(),
        ),
        GetPage(
          name: Route.bookcaseDetail,
          page: () => const BookcaseDetailView(),
        ),
        GetPage(
          name: Route.reader,
          page: () => const ReaderView(),
        ),
      ],
    ),
  ];
}
