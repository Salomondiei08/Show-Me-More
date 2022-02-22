import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InfoListItem extends StatelessWidget {
  const InfoListItem({
    Key? key,
    required this.icon,
    required this.text,
    this.isFirst = false,
    this.isLast = false,
    this.onPressed
  }) : super(key: key);

  final IconData icon;
  final String text;
  final bool isFirst;
  final bool isLast;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    if (isFirst) {
      return ListTile(
        onTap: onPressed,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          side: BorderSide(color: Colors.white70, width: 1),
        ),
        leading: Icon(
          icon,
          color: Colors.white,
          size: 25.sp,
        ),
        title: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.sp),
        ),
      );
    } else if (isLast) {
      return ListTile(
        onTap: onPressed,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          side: BorderSide(color: Colors.white70, width: 1),
        ),
        leading: Icon(
          icon,
          color: Colors.white,
          size: 25.sp,
        ),
        title: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.sp),
        ),
      );
    } else {
      return ListTile(
        onTap: onPressed,
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.white70, width: 1),
        ),
        leading: Icon(
          icon,
          color: Colors.white,
          size: 25.sp,
        ),
        title: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.sp),
        ),
      );
    }
  }
}
