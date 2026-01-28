class Favorite {
  final String id;
  final String userId;
  final String productId;

  Favorite({
    required this.id,
    required this.userId,
    required this.productId,
  });

  factory Favorite.fromJson(Map<String, dynamic> json) {
    return Favorite(
      id: json['id'] as String,
      userId: json['userId'] as String,
      productId: json['productId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'productId': productId,
    };
  }
}
