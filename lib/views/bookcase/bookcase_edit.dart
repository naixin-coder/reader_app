/*
 * @Author: 刘林
 * @Date: 2021-10-09 14:16:36
 * @LastEditors: 刘林
 * @LastEditTime: 2021-10-11 16:08:32
 */
import 'package:reader_app/views/bookcase/widgets/book_card.dart';
import 'package:flutter/material.dart';

class BookcaseEditView extends StatefulWidget {
  const BookcaseEditView({Key? key}) : super(key: key);

  @override
  _BookcaseEditViewState createState() => _BookcaseEditViewState();
}

class _BookcaseEditViewState extends State<BookcaseEditView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: const Padding(
          padding: EdgeInsets.only(left: 15, top: 17),
          child: Text(
            '全选',
            style: TextStyle(
              color: Color(0xFF000000),
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15, top: 17),
            child: Text(
              '取消',
              style: TextStyle(
                color: Color(0xFF000000),
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(18.0, 0, 18.0, 20.0),
        child: GridView.custom(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 186 / 395,
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            (context, index) {
              return const BookCard();
            },
            childCount: 15,
          ),
        ),
      ),
    );
  }
}
