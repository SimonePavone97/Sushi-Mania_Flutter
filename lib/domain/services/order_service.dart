// order_service.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sushi_restaurant_app/data/models/order_model.dart';
import 'package:logger/logger.dart';

class OrderService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final Logger _logger = Logger();

  Future<void> placeOrder(OrderModel order) async {
    try {
      await _firestore.collection('orders').add(order.toMap());
    } catch (e) {
      _logger.e('Errore durante il salvataggio dell\'ordine: $e');
      rethrow;
    }
  }

  Future<List<OrderModel>> fetchOrders() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
      await _firestore.collection('orders').get();
      List<OrderModel> orders = snapshot.docs
          .map((doc) => OrderModel.fromMap(doc.data()))
          .toList();
      return orders;
    } catch (e) {
      _logger.e('Errore durante il recupero degli ordini: $e');
      rethrow;
    }
  }

  Future<List<OrderModel>> fetchConfirmedOrders() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection('orders')
          .where('status', isEqualTo: 'Confirmed')
          .get();
      List<OrderModel> confirmedOrders = snapshot.docs
          .map((doc) => OrderModel.fromMap(doc.data()))
          .toList();
      return confirmedOrders;
    } catch (e) {
      _logger.e('Errore durante il recupero degli ordini confermati: $e');
      rethrow;
    }
  }
}
