import 'package:flutter/material.dart';
import 'package:getx_part2/utils/colors.dart';
import 'package:getx_part2/widgets/SmallText.dart';

class TextAndIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  final Color textColor;

  const TextAndIcon(
      {Key? key,
      required this.icon,
      required this.text,
      this.iconColor = AppColors.mainColor,
      this.textColor = AppColors.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        const SizedBox(
          width: 5,
        ),
        SmallText(
          text: text,
          color: textColor,
        )
      ],
    );
  }
}
