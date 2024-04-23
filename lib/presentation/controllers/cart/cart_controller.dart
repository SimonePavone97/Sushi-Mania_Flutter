import 'package:get/get.dart';
import 'package:sushi_restaurant_app/domain/entities/menu_item.dart';

class CartController extends GetxController {
  final RxList<MenuItem> cartItems = <MenuItem>[].obs;

  void addItemToCart(MenuItem item) {
    final existingItem = cartItems.firstWhereOrNull((cartItem) => cartItem == item);

    if (existingItem != null) {
      existingItem.quantity.value++; // Modifica della quantità usando .value
    } else {
      item.quantity = 1.obs; // Modifica della quantità come RxInt
      cartItems.add(item);
    }
  }

  void removeFromCart(MenuItem item, {int quantityToRemove = 0}) {
    if (quantityToRemove > 0 && item.quantity.value > 1) {
      item.quantity.value -= quantityToRemove; // Modifica della quantità usando .value
    } else {
      cartItems.remove(item);
    }
  }

  double getTotalPrice() {
    try {
      double total = 0.0;
      for (var item in cartItems) {
        total += item.price * item.quantity.value; // Modifica della quantità usando .value
      }
      return double.parse(total.toStringAsFixed(2));
    } catch (e) {
      print("Errore nel calcolo del totale: $e");
      return 0.0;
    }
  }

  void clearCart() {
    cartItems.clear();
  }
}
