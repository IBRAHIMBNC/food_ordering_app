import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../controllers/cart_controller.dart';
import '../../../utils/colors.dart';
import '../../../widgets/BigText.dart';

class QuantityCounter extends StatelessWidget {
  final CartController cartController = Get.find();
  Rx<int> quantity = 0.obs;
  final String id;
  QuantityCounter({Key? key, required int quantity, required this.id})
      : super(key: key) {
    this.quantity.value = quantity;
  }

  void incrementItem() {
    if (quantity < 20) {
      cartController.incrementItem(id);
    }
  }

  void decrementItem() {
    if (quantity > 1) {
      cartController.decrementItem(id);
    } else {
      cartController.removeItem(id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.h,
      width: 23.w,
      decoration: BoxDecoration(
          color: AppColors.mainColor, borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: decrementItem,
              child: const Icon(Icons.remove, color: Colors.white),
            ),
            Obx(
              () =>
                  BigText(color: Colors.white, text: quantity.value.toString()),
            ),
            GestureDetector(
              onTap: incrementItem,
              child: const Icon(Icons.add, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
