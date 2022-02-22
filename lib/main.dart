import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:provider/provider.dart';
import 'package:show_me_more/providers/articles_provider.dart';
import 'package:show_me_more/screens/main_screen.dart';
import 'helpers/routes.dart' as route;
import 'providers/places_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Articles(),
        ),
        ChangeNotifierProvider(
          create: (context) => Places(),
        ),
      ],
      child: const ShowMeApp(),
    ),
  );
}

class ShowMeApp extends StatelessWidget {
  const ShowMeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Show Me More',
      routes: route.routeTable,
      home: ResponsiveSizer(
        builder: (context, orientation, screentype) => const MainScreen(),
      ),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: route.routeTable['mainScreen']!);
      },
      theme: ThemeData(),
    );
  }
}
