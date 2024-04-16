import 'package:get/get.dart';
import 'package:sushi_restaurant_app/domain/entities/menu_item.dart';
import 'package:collection/collection.dart';

class CartController extends GetxController {
  final RxList<MenuItem> cartItems = <MenuItem>[].obs;

  void addItemToCart(MenuItem item) {
    // Cerca l'articolo nel carrello
    final existingItem = cartItems.firstWhereOrNull((cartItem) => cartItem == item);


    // Se l'articolo è già nel carrello, incrementa la quantità
    if (existingItem != null) {
      existingItem.quantity++;
    } else {
      // Altrimenti, aggiungi l'articolo al carrello con quantità 1
      item.quantity = 1;
      cartItems.add(item);
    }
  }


  void removeFromCart(MenuItem item) {
    cartItems.remove(item);
  }

  double getTotalPrice() {
    try {
      double total = 0.0;
      for (var item in cartItems) {
        total += item.price * item.quantity; // Moltiplica il prezzo per la quantità
      }
      return double.parse(total.toStringAsFixed(2)); // Restituisce il totale con due cifre decimali
    } catch (e) {
      print("Errore nel calcolo del totale: $e");
      return 0.0; // In caso di errore, restituisce 0.0
    }
  }


  void clearCart() {
    cartItems.clear();
  }
}
