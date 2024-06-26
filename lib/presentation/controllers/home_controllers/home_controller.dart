import 'package:get/get.dart';
import 'package:sushi_restaurant_app/domain/entities/menu_item.dart';
import 'package:sushi_restaurant_app/domain/repositories/menu_repository.dart';
import 'package:sushi_restaurant_app/presentation/controllers/cart_controllers/cart_controller.dart';
import 'package:logger/logger.dart';

class HomeController extends GetxController {
  final MenuRepository _menuRepository = Get.find<MenuRepository>();
  final CartController cartController = Get.put(CartController());
  final Logger _logger = Logger();

  // Lista reattiva per memorizzare gli elementi del menu
  var menuItems = <MenuItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Chiamata al metodo per recuperare i dati dal repository
    getMenuItems();
  }

  // Metodo per recuperare gli elementi del menu
  Future<void> getMenuItems() async {
    try {
      // Recupera gli elementi del menu utilizzando il repository
      List<MenuItem> items = await _menuRepository.getMenuItems();
      // Aggiorna la lista reattiva con i nuovi dati
      menuItems.assignAll(items);
    } catch (e) {
      // Gestisci eventuali errori qui
      _logger.e('Errore durante il recupero degli elementi del menu: $e');
    }
  }

  // Metodo per aggiungere un elemento al carrello
  void addToCart(MenuItem item) {
    try {
      cartController.addItemToCart(item);
      // Mostra un messaggio di conferma aggiunta al carrello
      Get.snackbar(
        'Carrello',
        '${item.name} aggiunto al carrello',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    } catch (e) {
      // Gestisci eventuali errori qui
      _logger.e('Errore durante l\'aggiunta al carrello: $e');
    }
  }
}
