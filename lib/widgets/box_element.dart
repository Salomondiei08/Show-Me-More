import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../models/place.dart';
import '../screens/detail_screen.dart';

class BoxElement extends StatelessWidget {
  const BoxElement({
    required this.place,
    Key? key,
  }) : super(key: key);

  final place;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DetailScreen(
            place: place,
          ),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: CachedNetworkImageProvider(
              place.imageUrl,
            ),
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
