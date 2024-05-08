import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sushi_restaurant_app/data/models/order_model.dart';
import 'package:sushi_restaurant_app/presentation/controllers/order_controllers/order_controller.dart';

import '../../controllers/cart_controllers/cart_controller.dart';

class OrderScreen extends StatelessWidget {
  final CartController _cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    Get.put(OrderController(_cartController));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ordini Confermati'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: GetX<OrderController>(
          builder: (_) {
            if (_.orders.isEmpty) {
              return const Center(
                child: Text(
                  'Nessun ordine confermato.',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: _.orders.length,
                itemBuilder: (context, index) {
                  OrderModel order = _.orders[index];
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ordine #${order.orderId}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text('Data: ${DateFormat("HH:mm").format(order.createdAt)}',
                              style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Totale: ${order.total}€',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Stato: ${order.status}',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
