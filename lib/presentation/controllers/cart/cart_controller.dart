import 'package:get/get.dart';
import 'package:sushi_restaurant_app/domain/entities/menu_item.dart';

class CartController extends GetxController {
  final RxList<MenuItem> cartItems = <MenuItem>[].obs;

  void addItemToCart(MenuItem item) {
    cartItems.add(item);
  }

  void removeFromCart(MenuItem item) {
    cartItems.remove(item);
  }

  double getTotalPrice() {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.price;
    }
    return total;
  }

  void clearCart() {
    cartItems.clear();
  }
}
