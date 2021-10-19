/*
 * @Author: 刘林
 * @Date: 2021-10-11 15:13:04
 * @LastEditors: 刘林
 * @LastEditTime: 2021-10-14 10:27:03
 */

import 'package:reader_app/models/acticle.dart';
import 'package:reader_app/models/catalog.dart';
import 'package:reader_app/utils/request.dart';
import 'package:reader_app/utils/screen.dart';
import 'package:reader_app/views/reader/widget/reader_page_agent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widget/reader_menu.dart';
import 'widget/reader_view.dart';

enum PageJumpType { stay, firstPage, lastPage }

class ReaderView extends StatefulWidget {
  const ReaderView({Key? key}) : super(key: key);

  @override
  _ReaderViewState createState() => _ReaderViewState();
}

class _ReaderViewState extends State<ReaderView> with RouteAware {
  int pageIndex = 0;
  bool isMenuVisiable = false;
  PageController pageController = PageController(keepPage: false);
  bool isLoading = false;
  double topSafeHeight = 0;

  Article? preArticle;
  Article? currentArticle;
  Article? nextArticle;

  List<Catalog> catalogList = [];

  @override
  void initState() {
    super.initState();
    pageController.addListener(onScroll);
    setup();
    fetchCatalog();
  }

  @override
  void dispose() {
    pageController.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.dispose();
  }

  @override
  void didPop() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
  }

  Future<Article> fetchArticle(int? articleId) async {
    var response = await Request.mock('article_$articleId');
    Article article = Article.fromJson(response);
    var contentHeight = Screen.height -
        Screen.topSafeHeight -
        37 -
        Screen.bottomSafeHeight -
        37 -
        20;
    var contentWidth = Screen.width - 15 - 10;
    article.pageOffsets = ReaderPageAgent.getPageOffsets(
        article.content, contentHeight, contentWidth, 20);
    return article;
  }

  fetchPreviousArticle(int? articleId) async {
    if (isLoading || articleId == 0) {
      return;
    }
    isLoading = true;
    preArticle = await fetchArticle(articleId);
    pageController.jumpToPage(preArticle!.pageCount + pageIndex);
    isLoading = false;
    setState(() {});
  }

  fetchNextArticle(int? articleId) async {
    if (isLoading || articleId == 0) {
      return;
    }
    isLoading = true;
    nextArticle = await fetchArticle(articleId);
    isLoading = false;
    setState(() {});
  }

  fetchCatalog() async {
    List<dynamic> response = await Request.mock('catalog');
    for (var res in response) {
      catalogList.add(Catalog.fromJson(res));
    }
  }

  void setup() async {
    // await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    // overlays: []);
    // 不延迟的话，安卓获取到的topSafeHeight是错的。
    // await Future.delayed(const Duration(milliseconds: 100), () {});
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    await resetContent(1000, PageJumpType.stay);
  }

  resetContent(int articleId, PageJumpType jumpType) async {
    currentArticle = await fetchArticle(articleId);
    if (currentArticle!.preArticleId! > 0) {
      preArticle = await fetchArticle(currentArticle!.preArticleId);
    }
    if (currentArticle!.nextArticleId! > 0) {
      nextArticle = await fetchArticle(currentArticle!.nextArticleId);
    }
    if (jumpType == PageJumpType.firstPage) {
      pageIndex = 0;
    } else if (jumpType == PageJumpType.lastPage) {
      pageIndex = currentArticle!.pageCount - 1;
    }
    if (jumpType != PageJumpType.stay) {
      pageController.jumpToPage(preArticle!.pageCount + pageIndex);
    }

    setState(() {});
  }

  onTap(Offset position) async {
    double xRate = position.dx / Screen.width;
    if (xRate > 0.33 && xRate < 0.66) {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
      );
      setState(() {
        isMenuVisiable = true;
      });
    } else if (xRate >= 0.66) {
      // nextPage();
    } else {
      // previousPage();
    }
  }

  onScroll() {
    var page = pageController.offset / Screen.width;
    var nextArtilePage = currentArticle!.pageCount +
        (preArticle != null ? preArticle!.pageCount : 0);
    if (page >= nextArtilePage) {
      // 下一页
      preArticle = currentArticle;
      currentArticle = nextArticle;
      nextArticle = null;
      pageIndex = 0;
      pageController.jumpToPage(preArticle!.pageCount);
      fetchNextArticle(currentArticle!.nextArticleId);
      setState(() {});
    }
    if (preArticle != null && page <= preArticle!.pageCount - 1) {
      nextArticle = currentArticle;
      currentArticle = preArticle;
      preArticle = null;
      pageIndex = currentArticle!.pageCount - 1;
      pageController.jumpToPage(currentArticle!.pageCount - 1);
      fetchPreviousArticle(currentArticle!.preArticleId);
      setState(() {});
    }
  }

  onPageChanged(int index) {
    var page = index - (preArticle != null ? preArticle!.pageCount : 0);
    if (page < currentArticle!.pageCount && page >= 0) {
      setState(() {
        pageIndex = page;
      });
    }
  }

  Widget buildPage(BuildContext context, int index) {
    var page = index - (preArticle != null ? preArticle!.pageCount : 0);
    Article article;
    if (page >= currentArticle!.pageCount) {
      // 到达下一章了
      article = nextArticle!;
      page = 0;
    } else if (page < 0) {
      // 到达上一章了
      article = preArticle!;
      page = preArticle!.pageCount - 1;
    } else {
      article = currentArticle!;
    }
    return GestureDetector(
      onTapUp: (TapUpDetails details) {
        onTap(details.globalPosition);
      },
      child: Container(
        color: Colors.transparent,
        // margin: const EdgeInsets.fromLTRB(15, 25, 15, 20),
        child: ReaderContentView(
          article: article,
          page: page,
          topSafeHeight: topSafeHeight,
        ),
      ),
    );
  }

  buildPageView() {
    int itemCount = (preArticle != null ? preArticle!.pageCount : 0) +
        (currentArticle != null ? currentArticle!.pageCount : 0) +
        (nextArticle != null ? nextArticle!.pageCount : 0);
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      controller: pageController,
      itemCount: itemCount,
      itemBuilder: buildPage,
      onPageChanged: onPageChanged,
    );
  }

  hideMenu() {
    setState(() {
      isMenuVisiable = !isMenuVisiable;
    });
  }

  buildReaderMenu() {
    if (!isMenuVisiable) {
      return Container();
    }
    return ReaderMenuView(
      catalogList: catalogList,
      hideMenu: hideMenu,
      onToggleChapter: (Catalog catalog) {
        resetContent(catalog.id, PageJumpType.firstPage);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle.dark,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              bottom: 0,
              child: Image.asset(
                'assets/img/read_bg.png',
                fit: BoxFit.cover,
              ),
            ),
            buildPageView(),
            buildReaderMenu(),
          ],
        ),
      ),
    );
  }
}
