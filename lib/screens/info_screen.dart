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
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Discover AR in the way you've never seen it !",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const Text(
                        "App developped with 💗 by DIEI Salomon, EFFANGONO Maxime and TEYA Ama",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
