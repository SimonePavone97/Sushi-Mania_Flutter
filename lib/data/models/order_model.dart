class OrderModel {
  final String orderId;
  final String tableId;
  final List<Map<String, dynamic>> items;
  final double total;
  final DateTime createdAt;
  late final String status;

  OrderModel({
    required this.orderId,
    required this.tableId,
    required this.items,
    required this.total,
    required this.createdAt,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'tableId': tableId,
      'items': items,
      'total': total,
      'createdAt': createdAt,
      'status': status,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      orderId: map['orderId'],
      tableId: map['tableId'],
      items: List<Map<String, dynamic>>.from(map['items']),
      total: map['total'],
      createdAt: map['createdAt'].toDate(),
      status: map['status'],
    );
  }
}
