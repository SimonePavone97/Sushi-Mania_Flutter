import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sushi_restaurant_app/domain/entities/menu_item.dart';
import 'package:sushi_restaurant_app/presentation/controllers/cart/cart_controller.dart';
import 'package:sushi_restaurant_app/presentation/controllers/order/order_controller.dart';
import 'package:sushi_restaurant_app/routes.dart';

import '../../../data/models/order_model.dart';
import '../order/order_screen.dart';

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.find();
  final OrderController orderController = Get.put(OrderController(Get.find()));


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrello'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFAFAFA),
              Color(0xFFE0E0E0),
            ],
          ),
        ),
        child: Obx(() {
          if (cartController.cartItems.isEmpty) {
            return const Center(
              child: Text(
                'Nessun articolo nel carrello',
                style: TextStyle(color: Colors.black),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: cartController.cartItems.length,
              itemBuilder: (context, index) {
                MenuItem cartItem = cartController.cartItems[index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: const Offset(0, 2),
                              ),
                            ],
                            image: DecorationImage(
                              image: NetworkImage(cartItem.imageURL),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cartItem.name,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                'Prezzo: ${cartItem.price}€',
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Obx(() {
                                    return Text(
                                      'Quantità: ${cartItem.quantity.value}',
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black54,
                                      ),
                                    );
                                  }),
                                  const SizedBox(height: 8.0),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          cartController.removeFromCartOne(cartItem);
                                        },
                                        child: const Text("Elimina"),
                                      ),
                                      const SizedBox(width: 8.0),
                                      IconButton(
                                        icon: const Icon(Icons.remove,
                                          color: Colors.black,),
                                        onPressed: () {
                                          cartController.removeFromCart(cartItem, quantityToRemove: 1);
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        }),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                // Naviga alla schermata del menu
                Get.toNamed(AppRoutes.home);
              },
            ),
            IconButton(
              icon: const Icon(Icons.card_travel_outlined),
              onPressed: () {
                // Naviga alla schermata dell'ordine
                Get.toNamed(AppRoutes.order);
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (cartController.isCartEmpty()) {
                  // Mostra un messaggio di avviso se il carrello è vuoto
                  Get.snackbar(
                    'Attenzione',
                    'Impossibile inviare un ordine vuoto',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                } else {
                  // Converte gli elementi del carrello in un singolo oggetto OrderModel
                  OrderModel orderModel = cartController.convertToOrderModel();
                  // Invia l'ordine al controller dell'ordine solo se il carrello non è vuoto
                  orderController.placeOrder(orderModel);
                  // Svuota il carrello
                  cartController.clearCart();
                  // Mostra un messaggio di conferma
                  Get.snackbar(
                    'Ordine inviato',
                    'Grazie per il tuo ordine!',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              },
              child: const Text("Conferma ordine"),
            ),
          ],
        ),
      ),
    );
  }
}
