import 'package:flutter/material.dart';
import 'package:getx_part2/screens/home_screen/home_screen.dart';
import 'package:getx_part2/utils/colors.dart';
import 'package:sizer/sizer.dart';

class BigText extends StatelessWidget {
  final String text;
  final Color color;
  final TextOverflow textOverflow;
  final double size;

  const BigText({
    Key? key,
    required this.text,
    this.color = AppColors.mainColor,
    this.textOverflow = TextOverflow.ellipsis,
    this.size = 15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        overflow: textOverflow,
        fontFamily: robotoFont,
        fontSize: size.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
