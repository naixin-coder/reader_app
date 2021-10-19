/*
 * @Author: 刘林
 * @Date: 2021-10-12 10:13:53
 * @LastEditors: 刘林
 * @LastEditTime: 2021-10-12 11:17:22
 */
class Article {
  int? id;
  int? novelId;
  String? title;
  String? content;
  int? price;
  int? index;
  int? nextArticleId;
  int? preArticleId;

  List<Map<String, int>>? pageOffsets;

  Article.fromJson(Map data) {
    id = data['id'];
    novelId = data['novel_id'];
    title = data['title'];
    content = data['content'];
    content = '　　' + content!;
    content = content!.replaceAll('\n', '\n　　');
    price = data['price'];
    index = data['index'];
    nextArticleId = data['next_id'];
    preArticleId = data['prev_id'];
  }

  String stringAtPageIndex(int index) {
    var offset = pageOffsets![index];
    return content!.substring(offset['start'] ?? 0, offset['end'] ?? 0);
  }

  int get pageCount {
    return pageOffsets!.length;
  }
}
