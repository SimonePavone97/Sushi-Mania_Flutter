class MenuItem {
  final String id;
  final String name;
  final double price;
  final String imageURL;
  final String category;
  final String description;
  int quantity;

  MenuItem({
    required this.id,
    required this.name,
    required this.price,
    required this.imageURL,
    required this.category,
    required this.description,
    this.quantity = 1,
  });

  double get totalPrice => price * quantity; // Calcolo del prezzo totale

  factory MenuItem.fromMap(Map<String, dynamic> map) {
    return MenuItem(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      price: (map['price'] ?? 0.0).toDouble(),
      imageURL: map['imageURL'] ?? '',
      category: map['category'] ?? '',
      description: map['description'] ?? '',
      quantity: map['quantity'] ?? 1,
    );
  }
}
