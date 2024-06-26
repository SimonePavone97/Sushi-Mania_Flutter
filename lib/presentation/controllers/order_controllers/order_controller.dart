import 'package:get/get.dart';
import 'package:sushi_restaurant_app/domain/services/order_service.dart';
import '../../../data/models/order_model.dart';
import '../cart_controllers/cart_controller.dart';
import 'package:logger/logger.dart';

class OrderController extends GetxController {
  final OrderService _orderService = OrderService();
  final CartController _cartController;
  final Logger _logger = Logger();

  // Lista degli ordini confermati
  RxList<OrderModel> orders = <OrderModel>[].obs;

  OrderController(this._cartController);

  @override
  void onInit() {
    super.onInit();
    // Chiamata per recuperare gli ordini confermati
    fetchConfirmedOrders();
  }

  // Metodo per recuperare gli ordini confermati dal backend
  Future<void> fetchConfirmedOrders() async {
    try {
      // Recupera gli ordini confermati dal servizio
      final List<OrderModel> confirmedOrders = await _orderService.fetchConfirmedOrders();
      // Aggiorna la lista degli ordini nel controller
      orders.assignAll(confirmedOrders);
    } catch (error, stackTrace) {
      _logger.e('Errore durante il recupero degli ordini confermati', error: error, stackTrace: stackTrace);
      // Gestisci l'errore, ad esempio mostrando un messaggio all'utente
    }
  }

  // Metodo per inviare un nuovo ordine
  Future<void> placeOrder(OrderModel orderModel) async {
    if (orderModel.items.isNotEmpty && orderModel.total > 0) {
      try {
        // Effettua la chiamata per inviare l'ordine al backend
        await _orderService.placeOrder(orderModel);
        // Ordine inviato con successo
        // Svuota il carrello
        _cartController.clearCart();
        // Aggiorna la lista degli ordini
        fetchConfirmedOrders();
        // Esegui altre azioni se necessario, ad esempio aggiornare lo stato dell'app
      } catch (error, stackTrace) {
        // Gestisci l'errore se la chiamata al backend fallisce
        _logger.e('Errore durante il piazzamento dell\'ordine', error: error, stackTrace: stackTrace);
        // Esegui altre azioni per gestire l'errore, ad esempio mostrare un messaggio all'utente
      }
    } else {
      _logger.w("L'ordine non contiene articoli o il totale è zero.");
      // Esegui altre azioni se l'ordine non può essere inviato, ad esempio mostrare un messaggio all'utente
    }
  }
}
