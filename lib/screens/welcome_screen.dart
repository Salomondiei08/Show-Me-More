import 'package:flutter/material.dart';
import '../themes/app_colors.dart' as color;
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import '../helpers/routes.dart' as route;

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: color.kcGrayColor,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 6.h, left: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SHOW ME',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 27.sp,
                        fontWeight: FontWeight.bold),
                  ),
                   SizedBox(
                    height: 0.5.h,
                  ),
                  Text(
                    "MORE",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: color.kcOrange,
                        fontSize: 27.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 68.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 6.w),
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: color.kcGreenColor),
                      onPressed: () => Navigator.pushReplacementNamed(
                          context, route.mainScreen),
                      child: Text(
                        'Start AR Experience !',
                        style: TextStyle(
                            color: color.kcGrayColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
