import 'package:flutter/material.dart';
import 'cart_item_model.dart';

class Cart extends ChangeNotifier {
  //* list of items in user cart
  List<CartItemModel> userCart = [];

  //* get cart
  List<CartItemModel> getUserCart() {
    return userCart;
  }

  //* get total price
  String getTotalPrice() {
    double total = 0;
    for (var item in userCart) {
      total += (double.tryParse(item.product.price) ?? 0) * item.quantity;
    }
    return total.toStringAsFixed(2);
  }

  //* add items to cart
  void addItemToCart(CartItemModel item) {
    // Check if same product with same size already exists
    final existingIndex = userCart.indexWhere(
      (cartItem) =>
          cartItem.product.id == item.product.id &&
          cartItem.selectedSize == item.selectedSize,
    );

    if (existingIndex != -1) {
      // Increase quantity
      userCart[existingIndex] = CartItemModel(
        product: userCart[existingIndex].product,
        selectedSize: userCart[existingIndex].selectedSize,
        quantity: userCart[existingIndex].quantity + 1,
      );
    } else {
      userCart.add(item);
    }
    notifyListeners();
  }

  //* remove item from cart
  void removeItemFromCart(CartItemModel item) {
    userCart.remove(item);
    notifyListeners();
  }

  //* update quantity
  void updateQuantity(CartItemModel item, int quantity) {
    if (quantity <= 0) {
      removeItemFromCart(item);
      return;
    }
    final index = userCart.indexOf(item);
    if (index != -1) {
      userCart[index] = CartItemModel(
        product: item.product,
        selectedSize: item.selectedSize,
        quantity: quantity,
      );
      notifyListeners();
    }
  }

  //* clear cart
  void clearCart() {
    userCart.clear();
    notifyListeners();
  }
}
