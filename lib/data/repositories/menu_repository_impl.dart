import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sushi_restaurant_app/domain/entities/menu_item.dart';
import 'package:sushi_restaurant_app/domain/repositories/menu_repository.dart';
import 'package:logger/logger.dart';


class MenuRepositoryImpl implements MenuRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final Logger _logger = Logger();

  @override
  Future<List<MenuItem>> getMenuItems() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('menu').get();
      return querySnapshot.docs
          .map((doc) => MenuItem.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e, stackTrace) {
      _logger.e('Error getting menu items', error: e, stackTrace: stackTrace);
      return [];
    }
  }
}

