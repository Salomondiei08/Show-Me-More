import 'package:flutter/material.dart';

import '../screens/about_screen.dart';
import '../screens/camera_screen.dart';
import '../screens/main_screen.dart';
import '../screens/info_screen.dart';


const String mainScreen = '/';
const String cameraScreen = '/camera_screen';
const String profileScreen = '/profile_screen';
const String aboutScreen = '/about_screen';


Map<String, Widget Function(BuildContext)> routeTable = {

mainScreen: (context) => const MainScreen(),
cameraScreen: (context) => const CameraScreen(),
profileScreen: (context) => const InfoScreen(),
aboutScreen: (context) => const AboutScreen(),
};
