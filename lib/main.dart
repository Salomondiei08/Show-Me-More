import 'package:flutter/material.dart';
import 'helpers/routes.dart' as route;

void main() {
  runApp(const ShowMeApp());
}

class ShowMeApp extends StatelessWidget {
  const ShowMeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Show Me More',
      routes: route.routeTable,
      initialRoute: route.mainScreen,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: route.routeTable['mainScreen']!);
      },
      theme: ThemeData(),
    );
  }
}
