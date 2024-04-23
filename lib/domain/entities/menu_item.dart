import 'package:get/get.dart';

class MenuItem {
  final String id;
  final String name;
  final double price;
  final String imageURL;
  final String category;
  final String description;
  late RxInt quantity; // Modifica il tipo da int a RxInt

  MenuItem({
    required this.id,
    required this.name,
    required this.price,
    required this.imageURL,
    required this.category,
    required this.description,
    int quantity = 1, // Impostazione predefinita della quantità a 1
  }) {
    this.quantity = quantity.obs; // Inizializza RxInt
  }

  factory MenuItem.fromMap(Map<String, dynamic> map) {
    return MenuItem(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      price: (map['price'] ?? 0.0).toDouble(),
      imageURL: map['imageURL'] ?? '',
      category: map['category'] ?? '',
      description: map['description'] ?? '',
      quantity: map['quantity'] ?? 1, // Impostazione predefinita della quantità a 1
    );
  }
}
