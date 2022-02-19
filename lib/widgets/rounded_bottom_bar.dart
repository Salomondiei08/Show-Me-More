import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../themes/app_colors.dart' as color;
class RoundedBottomBar extends StatelessWidget {
  const RoundedBottomBar(
      {Key? key, required this.selectedPage, required this.selectPage})
      : super(key: key);

  final int selectedPage;
  final selectPage;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        currentIndex: selectedPage,
        onTap: selectPage,
        type: BottomNavigationBarType.fixed,
        backgroundColor: color.kcGrayColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.info_circle),
            label: 'Infos',
            activeIcon: Icon(CupertinoIcons.info_circle_fill),
          ),
        ],
      ),
    );
  }
}
