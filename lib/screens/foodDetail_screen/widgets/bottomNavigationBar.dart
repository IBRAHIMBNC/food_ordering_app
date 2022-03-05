import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_part2/utils/colors.dart';
import 'package:getx_part2/widgets/BigText.dart';
import 'package:sizer/sizer.dart';

class FoodDetailBottomBar extends StatelessWidget {
  final int price;
  Rx<int> quantity = 0.obs;
  final Function(int quantity) addItemHandler;

  FoodDetailBottomBar(
      {Key? key, required this.price, required this.addItemHandler})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 15.h,
      width: 100.w,
      decoration: const BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 9.h,
            width: 30.w,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)),
            child: _quantityCounter(),
          ),
          MaterialButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              addItemHandler(quantity.value);
              quantity.value = 0;
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(20),
              width: 50.w,
              height: 9.h,
              decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(25)),
              child:
                  BigText(text: '\$$price | Add to cart', color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  Padding _quantityCounter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              if (quantity > 0) {
                quantity.value--;
              }
            },
            child: const Icon(Icons.remove, color: AppColors.textColor),
          ),
          Obx(
            () => BigText(
                color: AppColors.mainBlackColor,
                text: quantity.value.toString()),
          ),
          GestureDetector(
            onTap: () {
              if (quantity < 20) {
                quantity.value++;
              }
            },
            child: const Icon(Icons.add, color: AppColors.textColor),
          )
        ],
      ),
    );
  }
}
