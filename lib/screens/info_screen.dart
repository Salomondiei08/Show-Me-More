import 'package:flutter/material.dart';

import '../themes/app_colors.dart' as color;
import '../widgets/info_list.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.kcPrimaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 70,
                width: 70,
                child: Card(
                  color: color.kcOrange,
                  child: Icon(Icons.person),
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'SHOW ME ',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                        text: 'MORE',
                        style: TextStyle(
                            color: color.kcOrange,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Text(
                'v1.0.0 (2022)',
                style: TextStyle(color: Colors.white54),
              ),
              InfoList(),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum hIpsum.",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
