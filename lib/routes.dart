import 'package:get/get.dart';
import 'package:sushi_restaurant_app/presentation/controllers/cart/cart_controller.dart';
import 'package:sushi_restaurant_app/presentation/controllers/order/order_controller.dart';
import 'package:sushi_restaurant_app/presentation/screens/cart/cart_screen.dart';
import 'package:sushi_restaurant_app/presentation/screens/home/home_screen.dart';
import 'package:sushi_restaurant_app/presentation/screens/order/order_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String order = '/order'; // Aggiunta della costante per la route del menu
  static const String cart = '/cart'; // Aggiunta della costante per la route del carrello

  static final List<GetPage> routes = [
    GetPage(name: home, page: () => HomeScreen(), binding: HomeBinding()),
    GetPage(name: '/order', page: () => OrderScreen(), binding: OrderBinding(),
    ),
    //GetPage(name: menu, page: () => MenuScreen()), // Aggiunta della route per il menu
    GetPage(name: cart, page: () => CartScreen(), binding: CartBinding()), // Aggiunta della route per il carrello
  ];
}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderController());
  }
}

class OrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderController());
  }
}

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartController());
  }
}