import 'package:get/get.dart';
import 'package:sushi_restaurant_app/presentation/controllers/cart_controllers/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartController());
  }
}
