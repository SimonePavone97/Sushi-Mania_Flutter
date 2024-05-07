import 'package:get/get.dart';
import 'package:sushi_restaurant_app/presentation/controllers/cart/cart_controller.dart';
import 'package:sushi_restaurant_app/presentation/controllers/order/order_controller.dart';

class OrderBinding extends Bindings {
  @override
  void dependencies() {
    // Inietta il controller del carrello nel controller dell'ordine
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => OrderController(Get.find())); // Fornisci il CartController come argomento
  }
}
