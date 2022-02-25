import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/articles_provider.dart';
import 'box_element.dart';

class ArticleGrid extends StatelessWidget {
  const ArticleGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Articles>(
      builder: (_, article, child) => !article.isArticleListEmpty()
          ? GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 10,
              ),
              itemCount: article.getLenght(),
              itemBuilder: (_, index) => BoxElement(
                place: article.getAll()[index],
              ),
            )
          : const Center(
              child: Text(
                'No Populary Article',
                style: TextStyle(color: Colors.white),
              ),
            ),
    );
  }
}
