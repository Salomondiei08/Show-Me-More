import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../themes/app_colors.dart' as color;

import '../providers/places_provider.dart';

class Search extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return super.appBarTheme(context).copyWith(
          backgroundColor: color.kcGrayColor,
          scaffoldBackgroundColor: color.kcGrayColor,
          appBarTheme: AppBarTheme(
            color: color.kcGrayColor,
            toolbarTextStyle: const TextTheme(
              headline6: TextStyle(
                  // headline 6 affects the query text
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ).bodyText2,
            titleTextStyle: const TextTheme(
              headline6: TextStyle(
                  // headline 6 affects the query text
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ).headline6,
          ),
        );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.close),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null),
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    final places = Provider.of<Places>(context);
    final results = places
        .getAll()
        .where(
          (element) => element.name.toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();

    return ListView.builder(
      itemBuilder: (context, index) => Card(
        elevation: 00,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: color.kcGrayColor,
        child: ListTile(
          title: Text(
            results[index].name,
            style: const TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            results[index].description,
            style: const TextStyle(color: Colors.white),
          ),
          leading: CachedNetworkImage(imageUrl: results[index].imageUrl),
        ),
      ),
      itemCount: results.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final places = Provider.of<Places>(context);
    final results = places
        .getAll()
        .where(
          (element) => element.name.toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();

    return query.isEmpty
        ? Center(
            child: Text(
              'No Items found',
              style: TextStyle(color: Colors.white, fontSize: 20.sp),
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListView.builder(
              itemBuilder: (context, index) => Card(
                elevation: 00,
                color: color.kcGrayColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  title: Text(
                    results[index].name,
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    results[index].description,
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Image.network(results[index].imageUrl),
                ),
              ),
              itemCount: results.length,
            ),
          );
  }
}
