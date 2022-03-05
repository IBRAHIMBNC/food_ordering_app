import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:getx_part2/screens/home_screen/widgets/foodPage_body.dart';
import 'package:getx_part2/utils/colors.dart';
import 'package:getx_part2/widgets/BigText.dart';
import 'package:getx_part2/widgets/SmallText.dart';
import 'package:sizer/sizer.dart';

const String robotoFont = 'Roboto';

class HomeScreen extends StatelessWidget {
  final dbRef = FirebaseDatabase.instance.ref('data');

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    return Scaffold(
      body: Column(
        children: [
          buildAppBar(padding),
          const Expanded(
              child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(), child: FoodPageBody())),
        ],
      ),
    );
  }

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
                children: [
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
            onPressed: () async {
              var data = await dbRef.get();
              print(data.value);
            },
            child: Icon(
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
}
