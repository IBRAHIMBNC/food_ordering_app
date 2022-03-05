import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getx_part2/models/cartItem.dart';
import 'package:getx_part2/screens/cart_screen.dart/widgets/quantityCounter.dart';
import 'package:getx_part2/widgets/SmallText.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/colors.dart';
import '../../../widgets/BigText.dart';

class cartItemCard extends StatelessWidget {
  final CartItem cartItem;
  const cartItemCard({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15.h,
      width: 90.w,
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          width: 15.h,
          height: 15.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                  image: CachedNetworkImageProvider(cartItem.product.img!),
                  fit: BoxFit.cover)),
        ),
        Expanded(
          child: Container(
            // color: Colors.red,
            margin: EdgeInsets.only(left: 3.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(
                  text: cartItem.product.name!,
                  color: AppColors.titleColor,
                ),
                SizedBox(
                  height: 1.h,
                ),
                SmallText(
                  text: cartItem.product.description!,
                  color: AppColors.textColor,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BigText(
                      text: '\$ ${cartItem.product.price}',
                      color: Colors.red,
                    ),
                    QuantityCounter(
                      id: cartItem.product.id.toString(),
                      quantity: cartItem.quantity,
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
