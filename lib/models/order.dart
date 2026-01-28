class OrderItem {
  final String productId;
  final String productName;
  final String size;
  final int quantity;
  final String price;
  final String imagePath;

  OrderItem({
    required this.productId,
    required this.productName,
    required this.size,
    required this.quantity,
    required this.price,
    required this.imagePath,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      productId: json['productId'] as String,
      productName: json['productName'] as String,
      size: json['size'] as String,
      quantity: json['quantity'] as int,
      price: json['price'] as String,
      imagePath: json['imagePath'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'productName': productName,
      'size': size,
      'quantity': quantity,
      'price': price,
      'imagePath': imagePath,
    };
  }
}

class Order {
  final String id;
  final String userId;
  final List<OrderItem> items;
  final String totalPrice;
  final String status;
  final DateTime createdAt;
  final String? deliveryAddress;
  final String? phone;
  final String? name;

  Order({
    required this.id,
    required this.userId,
    required this.items,
    required this.totalPrice,
    required this.status,
    required this.createdAt,
    this.deliveryAddress,
    this.phone,
    this.name,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] as String,
      userId: json['userId'] as String,
      items: (json['items'] as List)
          .map((item) => OrderItem.fromJson(item as Map<String, dynamic>))
          .toList(),
      totalPrice: json['totalPrice'] as String,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      deliveryAddress: json['deliveryAddress'] as String?,
      phone: json['phone'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'items': items.map((item) => item.toJson()).toList(),
      'totalPrice': totalPrice,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
      'deliveryAddress': deliveryAddress,
      'phone': phone,
      'name': name,
    };
  }
}
