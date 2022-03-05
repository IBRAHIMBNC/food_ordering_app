// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_part2/models/cartItem.dart';
import 'package:getx_part2/models/product.dart';
import 'package:getx_part2/screens/cart_screen.dart/cart_screen.dart';
import 'package:getx_part2/screens/foodDetail_screen/widgets/bottomNavigationBar.dart';
import 'package:getx_part2/screens/foodDetail_screen/widgets/foodInfo.dart';
import 'package:getx_part2/screens/foodDetail_screen/widgets/itemDescription.dart';

import 'package:getx_part2/widgets/AppIcon.dart';
import 'package:getx_part2/widgets/BigText.dart';
import 'package:getx_part2/widgets/SmallText.dart';
import 'package:sizer/sizer.dart';
import '../../controllers/cart_controller.dart';

class FoodDetailScreen extends GetWidget<CartController> {
  CartController cartController = Get.find();
  final Product product;
  FoodDetailScreen({Key? key, required this.product}) : super(key: key);

  void addItem(int quantity) {
    final item = CartItem(product.id.toString(), product, quantity);

    cartController.addItem(item);
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              width: 100.w,
              height: 45.h,
              child: Hero(
                tag: product.id!,
                child: CachedNetworkImage(
                    imageUrl: product.img!, fit: BoxFit.cover),
              )),
          Positioned(
              top: topPadding.top,
              right: 0,
              left: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const CircularIcon(
                        icon: Icons.arrow_back,
                      ),
                    ),
                    GetBuilder<CartController>(
                      builder: (controller) => Badge(
                        padding: const EdgeInsets.all(6),
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
                            icon: Icons.shopping_cart_outlined,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
          Positioned(
            bottom: 0,
            child: Container(
              height: 45.h,
              width: 100.w,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      size: 20,
                      text: product.name!,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    FoodInfo(product: product),
                    SizedBox(height: 2.h),
                    BigText(
                      text: 'Introduce',
                      color: Colors.black54,
                    ),
                    SizedBox(height: 3.h),
                    Expanded(
                        child: ItemDescription(
                      text: product.description!,
                    )),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: FoodDetailBottomBar(
        addItemHandler: addItem,
        price: product.price!,
      ),
    );
  }
}
