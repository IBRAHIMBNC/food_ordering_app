import 'package:getx_part2/models/product.dart';

class CartItem {
  final String id;
  final Product product;
  int quantity;

  CartItem(this.id, this.product, this.quantity);
}
