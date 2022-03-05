import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_part2/controllers/popularProducts_controller.dart';
import 'package:getx_part2/controllers/recommandedProduct_conteroller.dart';
import 'package:getx_part2/models/product.dart';
import 'package:getx_part2/screens/foodDetail_screen/foodDetails_screen.dart';
import 'package:getx_part2/screens/home_screen/widgets/foodDetailCard.dart';
import 'package:getx_part2/screens/home_screen/widgets/recommendedFoodItem.dart';
import 'package:getx_part2/utils/colors.dart';
import 'package:getx_part2/widgets/BigText.dart';
import 'package:getx_part2/widgets/SmallText.dart';
import 'package:sizer/sizer.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  final recommendedProductsController = Get.put(RecommendedProducts());
  final popularProductsController = Get.put(PopularProductsController());
  final _pageCont = PageController(viewportFraction: 0.85);
  double _currPageValue = 0.0;
  final double scaleFactor = 0.8;
  final double _height = 30.h;
  // late List<Product> products;

  @override
  void initState() {
    _pageCont.addListener(() {
      setState(() {
        _currPageValue = _pageCont.page!;
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _pageCont.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          SizedBox(
            height: 47.h,
            child: GetBuilder<PopularProductsController>(builder: (controller) {
              final products = controller.popularProducts;

              if (controller.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              return Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _pageCont,
                      itemCount: products.length,
                      itemBuilder: (context, index) => MaterialButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          Get.to(
                              () => FoodDetailScreen(product: products[index]),
                              transition: Transition.fade);
                        },
                        child: pageViewItem(index, products[index]),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  DotsIndicator(
                    decorator: DotsDecorator(
                        activeSize: const Size(20, 10),
                        activeColor: AppColors.mainColor,
                        size: const Size.square(9),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    dotsCount: products.length,
                    position: _currPageValue,
                  ),
                ],
              );
            }),
          ),
          SizedBox(
            height: 3.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 2.h),
            child: Row(
              children: [
                BigText(text: 'Recommended', color: AppColors.mainBlackColor),
                SizedBox(
                  width: 10,
                ),
                SmallText(text: '. Food pairing')
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.h),
            child: GetBuilder<RecommendedProducts>(
              builder: (controller) {
                final products = controller.recommandedProducts;

                if (controller.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return MaterialButton(
                      padding: EdgeInsets.zero,
                      child: RecommendedFoodItem(product: products[index]),
                      onPressed: () {
                        Get.to(() => FoodDetailScreen(product: products[index]),
                            transition: Transition.fade);
                      },
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 1.5.h),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget pageViewItem(int index, Product product) {
    Matrix4 matrix = Matrix4.identity();

    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          scaleFactor + (_currPageValue - index + 1) * (1 - scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Hero(
            tag: product.id!,
            child: Container(
              height: _height,
              margin: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(product.img!),
                      fit: BoxFit.cover)),
            ),
          ),
          FoodDetailCard(product: product)
        ],
      ),
    );
  }
}
