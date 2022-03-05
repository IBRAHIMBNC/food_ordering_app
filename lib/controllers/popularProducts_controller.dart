import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:getx_part2/models/product.dart';

class PopularProductsController extends GetxController {
  List<Product> _popularProducts = [];
  List<Product> get popularProducts => [..._popularProducts];
  final _dbRef = FirebaseDatabase.instance.ref('popularFood');
  bool isLoading = false;

  @override
  void onInit() {
    fetchProducts();
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> fetchProducts() async {
    isLoading = true;
    DataSnapshot data = await _dbRef.get();
    final intoJson = json.encode(data.value);
    final products =
        Products.fromJson(Map<String, dynamic>.from(json.decode(intoJson)));

    _popularProducts = products.products!;

    isLoading = false;
    update();
  }
}
