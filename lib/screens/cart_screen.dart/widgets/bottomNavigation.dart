import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:sizer/sizer.dart';

import '../../../controllers/cart_controller.dart';
import '../../../utils/colors.dart';
import '../../../widgets/BigText.dart';

class CartBottomBar extends StatelessWidget {
  const CartBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(2.5.h), topLeft: Radius.circular(2.5.h)),
        color: AppColors.buttonBackgroundColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          GetBuilder<CartController>(builder: (cartCont) {
            var white;
            return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              width: 35.w,
              height: 9.h,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: BigText(
                  text: '\$ ${cartCont.total.toString()}',
                  color: AppColors.titleColor),
            );
          }),
          MaterialButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(20),
              width: 40.w,
              height: 9.h,
              decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(25)),
              child: BigText(text: 'Check out', color: Colors.white),
            ),
          )
        ]),
      ),
    );
  }
}
