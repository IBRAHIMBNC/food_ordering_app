import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_part2/models/cartItem.dart';
import 'package:getx_part2/screens/cart_screen.dart/widgets/bottomNavigation.dart';
import 'package:getx_part2/screens/cart_screen.dart/widgets/cartItemCard.dart';
import 'package:getx_part2/utils/colors.dart';
import 'package:getx_part2/widgets/BigText.dart';

import 'package:sizer/sizer.dart';

import '../../controllers/cart_controller.dart';
import '../../widgets/AppIcon.dart';
import '../../widgets/SmallText.dart';

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.find();

  CartScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        width: 100.w,
        height: 100.h,
        padding: EdgeInsets.only(top: padding.top),
        child: Column(
            children: [_buildAppBar(), _buildCartList(), CartBottomBar()]),
      ),
    );
  }

  Expanded _buildCartList() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: 100.w,
        // color: Colors.red,
        child: GetBuilder<CartController>(
          builder: (cartItemCont) => ListView.separated(
              itemBuilder: (context, index) {
                List<CartItem> cartItemList =
                    cartItemCont.cartItems.values.toList();

                return cartItemCard(
                  cartItem: cartItemList[index],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                    height: 15,
                  ),
              itemCount: cartItemCont.cartItems.length),
        ),
      ),
    );
  }

  Padding _buildAppBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: const CircularIcon(
              iconColor: Colors.white,
              icon: Icons.arrow_back,
              bgColor: AppColors.mainColor,
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              Get.back();
            },
            child: const CircularIcon(
              iconColor: Colors.white,
              icon: Icons.home,
              bgColor: AppColors.mainColor,
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          GetBuilder<CartController>(
            builder: (controller) => Badge(
              padding: EdgeInsets.all(6),
              shape: BadgeShape.circle,
              position: BadgePosition.topEnd(end: -2, top: -5),
              badgeContent: SmallText(
                text: controller.totalItems.toString(),
                color: Colors.white,
              ),
              child: InkWell(
                onTap: () {
                  Get.to(() => CartScreen());
                },
                child: const CircularIcon(
                  iconColor: Colors.white,
                  bgColor: AppColors.mainColor,
                  icon: Icons.shopping_cart_outlined,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
