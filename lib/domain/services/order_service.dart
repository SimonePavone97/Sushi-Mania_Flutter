// order_service.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sushi_restaurant_app/data/models/order_model.dart';

class OrderService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> placeOrder(OrderModel order) async {
    try {
      await _firestore.collection('orders').add(order.toMap());
    } catch (e) {
      // Gestisci eventuali errori qui
      print('Errore durante il salvataggio dell\'ordine: $e');
      rethrow; // Puoi gestire l'errore in modo personalizzato o lanciarlo di nuovo
    }
  }

  Future<List<OrderModel>> fetchOrders() async {
    try {
      // Recupera gli ordini dalla collezione 'orders' in Firestore
      QuerySnapshot<Map<String, dynamic>> snapshot =
      await _firestore.collection('orders').get();

      // Mappa i documenti restituiti in una lista di OrderModel
      List<OrderModel> orders = snapshot.docs
          .map((doc) => OrderModel.fromMap(doc.data()))
          .toList();

      return orders;
    } catch (e) {
      // Gestisci eventuali errori qui
      print('Errore durante il recupero degli ordini: $e');
      rethrow; // Puoi gestire l'errore in modo personalizzato o lanciarlo di nuovo
    }
  }

  // Metodo per recuperare gli ordini confermati
  Future<List<OrderModel>> fetchConfirmedOrders() async {
    try {
      // Recupera gli ordini confermati dalla collezione 'orders' in Firestore
      QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection('orders')
          .where('status', isEqualTo: 'confirmed')
          .get();

      // Mappa i documenti restituiti in una lista di OrderModel
      List<OrderModel> confirmedOrders = snapshot.docs
          .map((doc) => OrderModel.fromMap(doc.data()))
          .toList();

      return confirmedOrders;
    } catch (e) {
      // Gestisci eventuali errori qui
      print('Errore durante il recupero degli ordini confermati: $e');
      rethrow; // Puoi gestire l'errore in modo personalizzato o lanciarlo di nuovo
    }
  }
}
