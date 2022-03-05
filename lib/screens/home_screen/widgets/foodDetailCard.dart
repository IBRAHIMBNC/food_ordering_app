import 'package:flutter/material.dart';
import 'package:getx_part2/models/product.dart';
import 'package:getx_part2/utils/colors.dart';
import 'package:getx_part2/widgets/BigText.dart';
import 'package:getx_part2/widgets/SmallText.dart';
import 'package:sizer/sizer.dart';

import 'TextAndIcon.dart';

class FoodDetailCard extends StatelessWidget {
  final Product product;
  const FoodDetailCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.w),
        child: Container(
          height: 18.h,
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                blurRadius: 5.0,
                color: Color(0xffe8e8e8),
                offset: Offset(0, 5),
              )
            ],
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(text: product.name!, color: Colors.black87),
                const SizedBox(height: 10),
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
            ),
          ),
        ),
      ),
    );
  }
}
