import 'package:flutter/material.dart';

import '../screens/aboutScreen.dart';
import '../screens/cameraScreen.dart';
import '../screens/mainScreen.dart';
import '../screens/profileScreen.dart';


const String mainScreen = '/';
const String cameraScreen = '/camera_screen';
const String profileScreen = '/profile_screen';
const String aboutScreen = '/about_screen';


Map<String, Widget Function(BuildContext)> routeTable = {

mainScreen: (context) => const MainScreen(),
cameraScreen: (context) => const CameraScreen(),
profileScreen: (context) => const ProfileScreen(),
aboutScreen: (context) => const AboutScreen(),
};
