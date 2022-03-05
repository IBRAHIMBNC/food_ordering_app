import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getx_part2/models/product.dart';
import 'package:getx_part2/utils/colors.dart';
import 'package:getx_part2/widgets/BigText.dart';
import 'package:getx_part2/widgets/SmallText.dart';
import 'package:sizer/sizer.dart';
import 'TextAndIcon.dart';

class RecommendedFoodItem extends StatelessWidget {
  final Product product;
  const RecommendedFoodItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
                blurRadius: 5.0, offset: Offset(3, 5), color: Color(0xffe8e8e8))
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Hero(
              tag: product.id!,
              child: Container(
                height: 16.h,
                width: 16.h,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(product.img!)),
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            Expanded(
                child: Container(
              margin: const EdgeInsets.only(right: 5),
              padding: const EdgeInsets.only(top: 10, left: 10),
              height: 15.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(
                    text: product.name!,
                    color: AppColors.mainBlackColor,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  SmallText(
                    text: product.description!,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const TextAndIcon(
                          icon: Icons.circle_sharp,
                          iconColor: Colors.orange,
                          text: 'Normal'),
                      SizedBox(
                        width: 1.h,
                      ),
                      const TextAndIcon(
                          icon: Icons.place,
                          iconColor: AppColors.mainColor,
                          text: '1.7 Km'),
                      SizedBox(
                        width: 1.h,
                      ),
                      const TextAndIcon(
                          icon: Icons.access_time_rounded,
                          iconColor: Colors.orange,
                          text: '50min'),
                    ],
                  )
                ],
              ),
            ))
          ],
        ));
  }
}
