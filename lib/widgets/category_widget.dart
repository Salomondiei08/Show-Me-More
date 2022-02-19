import 'package:flutter/material.dart';
import '../themes/app_colors.dart' as color;

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
            height: 80,
            width: 135,
            child: Icon(
              icon,
              color: active ? color.kcGrayColor : Colors.white,
              size: 45,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          height: 20,
          width: 154,
        ),
      ],
    );
  }
}
