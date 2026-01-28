class Product {
  final String id;
  final String name;
  final String price;
  final String description;
  final List<String> imagePaths;
  final String categoryId;
  final Map<String, dynamic> characteristics;
  final List<String> availableSizes;
  final int stock;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.imagePaths,
    required this.categoryId,
    required this.characteristics,
    required this.availableSizes,
    required this.stock,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      price: json['price'] as String,
      description: json['description'] as String,
      imagePaths: List<String>.from(json['imagePaths'] as List),
      categoryId: json['categoryId'] as String,
      characteristics: json['characteristics'] as Map<String, dynamic>,
      availableSizes: List<String>.from(json['availableSizes'] as List),
      stock: json['stock'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'imagePaths': imagePaths,
      'categoryId': categoryId,
      'characteristics': characteristics,
      'availableSizes': availableSizes,
      'stock': stock,
    };
  }
}
