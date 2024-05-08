import 'package:cloud_firestore/cloud_firestore.dart';

class DataMenuRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getMenuItems() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('menu').get();
      return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      return [];
    }
  }
}
