import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sushi_restaurant_app/presentation/controllers/order/order_controller.dart';


class OrderScreen extends StatelessWidget {
  final OrderController orderController = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
                  () => ListView.builder(
                itemCount: orderController.orderItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(orderController.orderItems[index]),
                  );
                },
              ),
            ),
            Text('Total: \$${orderController.total}'),
          ],
        ),
      ),
    );
  }
}
