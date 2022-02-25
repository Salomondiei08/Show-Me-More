import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
          image: CachedNetworkImageProvider(
            article.imageUrl,
          ),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
