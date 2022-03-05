import 'package:flutter/material.dart';
import 'package:getx_part2/models/product.dart';
import 'package:getx_part2/screens/home_screen/widgets/TextAndIcon.dart';
import 'package:getx_part2/utils/colors.dart';
import 'package:getx_part2/widgets/SmallText.dart';
import 'package:sizer/sizer.dart';

class FoodInfo extends StatelessWidget {
  final Product product;
  const FoodInfo({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Wrap(
              children: List.generate(
                  5,
                  (index) => Icon(
                        Icons.star,
                        color: index < product.stars!
                            ? AppColors.mainColor
                            : Colors.grey,
                        size: 15,
                      )),
            ),
            const SizedBox(
              width: 10,
            ),
            const SmallText(text: '4.0'),
            const SizedBox(
              width: 10,
            ),
            const SmallText(text: '1245'),
            const SizedBox(
              width: 10,
            ),
            const SmallText(text: 'Comments')
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        Row(
          children: const [
            TextAndIcon(
                icon: Icons.circle_sharp,
                iconColor: Colors.orange,
                text: 'Normal'),
            SizedBox(
              width: 15,
            ),
            TextAndIcon(
                icon: Icons.place,
                iconColor: AppColors.mainColor,
                text: '1.7 Km'),
            SizedBox(
              width: 15,
            ),
            TextAndIcon(
                icon: Icons.access_time_rounded,
                iconColor: Colors.orange,
                text: '50min'),
          ],
        ),
      ],
    );
  }
}
