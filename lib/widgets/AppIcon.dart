import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CircularIcon extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final double size;
  const CircularIcon({
    Key? key,
    required this.icon,
    this.iconColor = Colors.black87,
    this.size = 13,
    this.bgColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: size.w,
      height: size.w,
      child: Icon(
        icon,
        color: iconColor,
        size: size * 2,
      ),
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: bgColor.withOpacity(0.7)),
    );
  }
}
