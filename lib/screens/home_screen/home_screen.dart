import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_part2/screens/cart_screen.dart/cart_screen.dart';
import 'package:getx_part2/screens/home_screen/widgets/foodPage_body.dart';
import 'package:getx_part2/utils/colors.dart';
import 'package:getx_part2/widgets/BigText.dart';
import 'package:getx_part2/widgets/SmallText.dart';
import 'package:sizer/sizer.dart';

import '../profile_screen/profile_screen.dart';

const String robotoFont = 'Roboto';

class HomeScreen extends StatelessWidget {
  final dbRef = FirebaseDatabase.instance.ref('data');
  Rx<int> currentInd = 0.obs;

  HomeScreen({Key? key}) : super(key: key);
  List pages = [Body(), CartScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[currentInd.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
            unselectedIconTheme: IconTheme.of(context),
            selectedItemColor: AppColors.mainColor,
            selectedIconTheme:
                IconTheme.of(context).copyWith(color: AppColors.mainColor),
            currentIndex: currentInd.value,
            onTap: (val) {
              currentInd.value = val;
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline), label: 'Profile')
            ]),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);
  Widget buildAppBar(EdgeInsets padding) {
    return Container(
      padding:
          EdgeInsets.only(top: padding.top, left: 20, right: 20, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BigText(text: 'Pakistan'),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  SmallText(
                    text: 'Peshawar',
                    color: Colors.black54,
                  ),
                  Icon(Icons.arrow_drop_down)
                ],
              )
            ],
          ),
          MaterialButton(
            height: 7.h,
            minWidth: 7.h,
            color: AppColors.mainColor,
            onPressed: () async {},
            child: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    return Column(
      children: [
        buildAppBar(padding),
        const Expanded(
            child: SingleChildScrollView(
                physics: BouncingScrollPhysics(), child: FoodPageBody())),
      ],
    );
  }
}
