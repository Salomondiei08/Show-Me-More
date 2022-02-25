import 'package:flutter/material.dart';
import 'package:show_me_more/screens/ar_view.dart';


import '../screens/camera_screen.dart';
import '../screens/main_screen.dart';
import '../screens/info_screen.dart';


const String mainScreen = '/main_screen';
const String cameraScreen = '/camera_screen';
const String profileScreen = '/profile_screen';
const String aboutScreen = '/about_screen';
const String arView = '/ar_view';


Map<String, Widget Function(BuildContext)> routeTable = {

mainScreen: (context) => const MainScreen(),
cameraScreen: (context) => const CameraScreen(),
profileScreen: (context) => const InfoScreen(),
arView: (context) => const ArView(),
};
