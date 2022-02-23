import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../themes/app_colors.dart' as color;

import '../providers/places_provider.dart';

class Search extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return super.appBarTheme(context).copyWith(
          backgroundColor: color.kcGrayColor,
          scaffoldBackgroundColor: color.kcGrayColor,
          appBarTheme: AppBarTheme(color: color.kcGrayColor,
          
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
          (element) => element.name.toLowerCase().startsWith(
                query.toLowerCase(),
              ),
        )
        .toList();

    return ListView.builder(
      itemBuilder: (context, index) => Card(
        child: ListTile(
          title: Text(results[index].name),
          subtitle: Text(results[index].description),
          leading: Image.network(results[index].imageUrl),
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
        ? const Center(
            child: Text('No Items'),
          )
        : ListView.builder(
            itemBuilder: (context, index) => Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                title: Text(results[index].name),
                subtitle: Text(results[index].description),
                leading: Image.network(results[index].imageUrl),
              ),
            ),
            itemCount: results.length,
          );
  }
}
