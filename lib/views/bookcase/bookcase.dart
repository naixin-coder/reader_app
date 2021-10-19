/*
 * @Author: 刘林
 * @Date: 2021-10-08 13:00:42
 * @LastEditors: 刘林
 * @LastEditTime: 2021-10-18 14:55:55
 */
import 'package:reader_app/routers/route.dart' as route;
import 'package:reader_app/utils/overflow_behavior.dart';
import 'package:reader_app/views/bookcase/widgets/add_book_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/book_card.dart';
import 'widgets/bookcase_title.dart';

class BookcaseView extends StatefulWidget {
  const BookcaseView({Key? key}) : super(key: key);

  @override
  _BookcaseViewState createState() => _BookcaseViewState();
}

class _BookcaseViewState extends State<BookcaseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text(
          '书架',
          style: TextStyle(
            fontFamily: 'PingFang Bold',
            color: Color(0xFF000000),
            fontSize: 23.0,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Get.rootDelegate.toNamed(route.Route.bookcaseEdit),
            icon: const Icon(
              Icons.more_horiz_rounded,
              color: Color(0xFF000000),
            ),
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: ScrollConfiguration(
        behavior: OverflowBehavior(),
        child: SingleChildScrollView(
          // physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
          child: Column(
            children: [
              const BookCaseTitle(),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: GridView.custom(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 186 / 395,
                  ),
                  childrenDelegate: SliverChildBuilderDelegate(
                    (context, index) {
                      print(index);
                      return index <= 4
                          ? const BookCard()
                          : const AddBookCard();
                    },
                    childCount: 6,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
