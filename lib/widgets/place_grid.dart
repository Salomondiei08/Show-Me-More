
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/places_provider.dart';
import 'box_element.dart';

class PlaceGrid extends StatelessWidget {
  const PlaceGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Places>(
        builder: (_, place, child) => !place.isPlaceListEmpty()
            ? GridView.builder(
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 3 / 5,
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 10,
                ),
                itemCount: place.getLenght(),
                itemBuilder: (_, index) => BoxElement(
                  article: place.getAll()[index],
                ),
              )
            : const Center(
                child: Text(
                  'No Populary Place',
                  style: TextStyle(color: Colors.white),
                ),
              ),
      );
  }
}