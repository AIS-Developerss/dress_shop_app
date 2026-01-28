import 'product.dart';

class CartItemModel {
  final Product product;
  final String selectedSize;
  final int quantity;

  CartItemModel({
    required this.product,
    required this.selectedSize,
    this.quantity = 1,
  });

  String get totalPrice {
    final price = double.tryParse(product.price) ?? 0;
    return (price * quantity).toStringAsFixed(2);
  }
}
