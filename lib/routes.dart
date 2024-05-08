import 'package:get/get.dart';
import 'package:sushi_restaurant_app/presentation/bindings/cart_bindings/cart_binding.dart';
import 'package:sushi_restaurant_app/presentation/bindings/order_bindings/order_binding.dart';
import 'package:sushi_restaurant_app/presentation/screens/cart/cart_screen.dart';
import 'package:sushi_restaurant_app/presentation/screens/home/home_screen.dart';
import 'package:sushi_restaurant_app/presentation/screens/order/order_screen.dart';


class AppRoutes {
  static const String home = '/';
  static const String order = '/order';
  static const String cart = '/cart';

  static final List<GetPage> routes = [
    GetPage(name: home, page: () => HomeScreen(), binding: CartBinding()), // Esempio di integrazione di CartBinding in HomeScreen
    GetPage(name: order, page: () => OrderScreen(), binding: OrderBinding()), // Esempio di integrazione di OrderBinding in OrderConfirmationScreen
    GetPage(name: cart, page: () => CartScreen(), binding: CartBinding()), // Integrazione di CartBinding in CartScreen
  ];
}