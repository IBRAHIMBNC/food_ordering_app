import 'package:get/get.dart';
import 'package:getx_part2/models/cartItem.dart';

class CartController extends GetxController {
  final Map<String, CartItem> _cartItems = {};
  Map<String, CartItem> get cartItems => {..._cartItems};

  int get totalItems {
    int quantity = 0;
    _cartItems.forEach((key, value) {
      quantity += value.quantity;
    });
    return quantity;
  }

  int get total {
    int total = 0;
    _cartItems.forEach((key, value) {
      total += value.product.price! * value.quantity;
    });

    return total;
  }

  void incrementItem(String id) {
    _cartItems.update(
        id,
        (value) => CartItem(
              value.id,
              value.product,
              value.quantity + 1,
            ));
    update();
  }

  void decrementItem(String id) {
    _cartItems.update(
        id,
        (value) => CartItem(
              value.id,
              value.product,
              value.quantity - 1,
            ));
    update();
  }

  void addItem(CartItem item) {
    if (_cartItems.containsKey(item.id)) {
      _cartItems.update(
          item.id,
          (value) => CartItem(
                value.id,
                value.product,
                value.quantity + item.quantity,
              ));
    } else {
      _cartItems.putIfAbsent(
          item.id, () => CartItem(item.id, item.product, item.quantity));
    }
    update();
  }

  void removeItem(String id) {
    if (_cartItems.containsKey(id)) {
      _cartItems.remove(id);
    }
    update();
  }
}
