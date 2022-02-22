import 'package:flutter/material.dart';

import '../themes/app_colors.dart' as color;
import '../widgets/info_list.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
                height: 10.h,
                width: 10.h,
                child: Card(
                  color: color.kcOrange,
                  child: Icon(
                    Icons.view_in_ar,
                    size: 25.sp,
                  ),
                ),
              ),
              Divider(
                height: 1.5.h,
              ),
              RichText(
                text: TextSpan(
                  text: 'SHOW ME ',
                  style:
                      TextStyle(fontSize: 23.sp, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                        text: 'MORE',
                        style: TextStyle(
                            color: color.kcOrange,
                            fontSize: 23.sp,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const Text(
                'v1.0.0 (2022)',
                style: TextStyle(color: Colors.white54),
              ),
              const InfoList(),
              const Padding(
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
