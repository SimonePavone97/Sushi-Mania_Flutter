import 'package:get/get.dart';
import 'package:sushi_restaurant_app/domain/entities/menu_item.dart';

class CartController extends GetxController {
  final RxList<MenuItem> cartItems = <MenuItem>[].obs;

  void addItemToCart(MenuItem item) {
    // Cerca l'articolo nel carrello
    final existingItemIndex = cartItems.indexWhere((cartItem) => cartItem.id == item.id);

    // Se l'articolo è già nel carrello, incrementa la quantità
    if (existingItemIndex != -1) {
      cartItems[existingItemIndex].quantity++;
    } else {
      // Altrimenti aggiungi l'articolo al carrello con quantità 1
      item.quantity = 1;
      cartItems.add(item);
    }
  }

  void removeFromCart(MenuItem item) {
    cartItems.remove(item);
  }

  double getTotalPrice() {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.price * item.quantity; // Moltiplica il prezzo per la quantità
    }
    return total;
  }

  void clearCart() {
    cartItems.clear();
  }
}
