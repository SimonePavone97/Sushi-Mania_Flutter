import 'package:get/get.dart';
import 'package:sushi_restaurant_app/domain/entities/menu_item.dart';
import '../../../data/models/order_model.dart';

class CartController extends GetxController {
  final RxList<MenuItem> cartItems = <MenuItem>[].obs;

  OrderModel convertToOrderModel() {
    List<Map<String, dynamic>> orderItems = cartItems.map((item) {
      return {
        'name': item.name,
        'price': item.price,
        'quantity': item.quantity.value,
      };
    }).toList();

    return OrderModel(
      items: orderItems,
      total: getTotalPrice(),
      createdAt: DateTime.now(),
      orderId: '',
      tableId: '',
      status: 'Confirmed',
    );
  }

  bool isCartEmpty() {
    return cartItems.isEmpty;
  }

  void addItemToCart(MenuItem item) {
    final existingItemIndex = cartItems.indexWhere((cartItem) => cartItem == item);

    if (existingItemIndex != -1) {
      cartItems[existingItemIndex].quantity.value++; // Incrementa la quantità dell'elemento esistente
    } else {
      item.quantity = 1.obs; // Imposta la quantità a 1 per il nuovo elemento
      cartItems.add(item); // Aggiungi il nuovo elemento al carrello
    }
  }

  void removeFromCart(MenuItem item, {int quantityToRemove = 1}) {
    final existingItemIndex = cartItems.indexWhere((cartItem) => cartItem == item);
    if (existingItemIndex != -1) {
      final existingItem = cartItems[existingItemIndex];
      if (existingItem.quantity.value > quantityToRemove) {
        existingItem.quantity.value -= quantityToRemove; // Rimuovi la quantità specificata se esiste abbastanza quantità
      } else {
        cartItems.removeAt(existingItemIndex); // Rimuovi completamente l'elemento se la quantità da rimuovere è maggiore o uguale alla quantità nel carrello
      }
    }
  }

  void removeFromCartOne(MenuItem item) {
      cartItems.remove(item); // Rimuove l'articolo direttamente anziché decrementarne la quantità
  }

  double getTotalPrice() {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.price * item.quantity.value; // Calcola il totale moltiplicando il prezzo per la quantità di ciascun elemento
    }
    return double.parse(total.toStringAsFixed(2));
  }

  void clearCart() {
    cartItems.clear(); // Svuota il carrello
  }
}
