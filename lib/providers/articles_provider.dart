import 'package:flutter/material.dart';

import '../models/article.dart';

class Articles with ChangeNotifier {
  List<Article> articleList = [];

  List<Article> getAll() => [...articleList];

  void addArticle(Article article) {
    articleList.add(article);
  }

  void deleteArticle(Article article) {
    articleList.removeWhere((oldArticle) => oldArticle.id == article.id);
  }

  List<Article> findByName(String articleName) {
    return [
      ...articleList.where((oldArticle) =>
          oldArticle.name.toLowerCase().startsWith(articleName.toUpperCase()))
    ];
  }

  int getLenght() => articleList.length;

  bool isArticleListEmpty() => articleList.isEmpty;
}
