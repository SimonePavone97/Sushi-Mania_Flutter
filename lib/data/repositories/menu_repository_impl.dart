import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sushi_restaurant_app/domain/entities/menu_item.dart';
import 'package:sushi_restaurant_app/domain/repositories/menu_repository.dart';

class MenuRepositoryImpl implements MenuRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<MenuItem>> getMenuItems() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('menu').get();
      return querySnapshot.docs
          .map((doc) => MenuItem.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error getting menu items: $e');
      return [];
    }
  }
}
