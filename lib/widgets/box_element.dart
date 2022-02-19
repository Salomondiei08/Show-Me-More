import 'package:flutter/material.dart';

import '../models/article.dart';

class BoxElement extends StatelessWidget {
  const BoxElement({
    required this.article,
    Key? key,
  }) : super(key: key);

  final article;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(article.imageUrl),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
