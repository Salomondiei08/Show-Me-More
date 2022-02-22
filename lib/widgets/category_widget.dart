import 'package:flutter/material.dart';
import '../themes/app_colors.dart' as color;

import 'package:responsive_sizer/responsive_sizer.dart';
class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key? key,
    required this.icon,
    required this.text,
    required this.active,
    required this.buttonColor,
    required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final bool active;
  final Color buttonColor;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            decoration: BoxDecoration(
              color: active ? buttonColor : color.kcGrayColor,
              borderRadius: BorderRadius.circular(12),
            ),
            height: 10.h,
            width: 35.w,
            child: Icon(
              icon,
              color: active ? color.kcGrayColor : Colors.white,
              size: 30.sp,
            ),
          ),
        ),
         SizedBox(
          height: 2.h,
        ),
        Expanded(
          child: SizedBox(
            child: Center(
              child: Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 15.sp),
              ),
            ),
            height: 10.h,
            width: 44.w
          ),
        ),
      ],
    );
  }
}
