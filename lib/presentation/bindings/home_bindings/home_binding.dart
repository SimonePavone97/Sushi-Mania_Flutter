import 'package:get/get.dart';
import 'package:sushi_restaurant_app/data/repositories/menu_repository_impl.dart';
import 'package:sushi_restaurant_app/presentation/controllers/home_controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Registra HomeController come dipendenza
    Get.lazyPut<HomeController>(() => HomeController());
    // Registra MenuRepositoryImpl come dipendenza
    Get.lazyPut<MenuRepositoryImpl>(() => MenuRepositoryImpl());
  }
}
