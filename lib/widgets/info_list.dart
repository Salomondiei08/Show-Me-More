import 'package:flutter/material.dart';

import '../themes/app_colors.dart' as color;

class InfoList extends StatelessWidget {
  const InfoList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color.kcGrayColor,
      margin: const EdgeInsets.all(25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.white70, width: 1),
      ),
      child: Column(
        children: const [
          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              side: BorderSide(color: Colors.white70, width: 1),
            ),
            leading: Icon(
              Icons.transfer_within_a_station_outlined,
              color: Colors.white,
              size: 25,
            ),
            title: Text(
              'See source code',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          ListTile(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white70, width: 1),
            ),
            leading: Icon(
              Icons.transfer_within_a_station_outlined,
              color: Colors.white,
              size: 25,
            ),
            title: Text(
              'Twitter',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          ListTile(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white70, width: 1),
            ),
            leading: Icon(
              Icons.help_outline,
              color: Colors.white,
              size: 25,
            ),
            title: Text(
              'Need Help ?',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          ListTile(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white70, width: 1),
            ),
            leading: Icon(
              Icons.share,
              color: Colors.white,
              size: 25,
            ),
            title: Text(
              'Share the app',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              side: BorderSide(color: Colors.white70, width: 1),
            ),
            leading: Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 25,
            ),
            title: Text(
              'Rate the app...',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
