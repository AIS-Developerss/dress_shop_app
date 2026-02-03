import 'package:flutter/material.dart';
import '../models/order.dart';
import '../services/api_client.dart';

class OrdersProvider extends ChangeNotifier {
  final ApiClient _apiService;

  OrdersProvider(this._apiService);
  List<Order> _orders = [];
  bool _isLoading = false;

  List<Order> get orders => _orders;
  bool get isLoading => _isLoading;

  Future<void> loadOrders(String userId) async {
    _isLoading = true;
    notifyListeners();
    try {
      _orders = await _apiService.getOrders(userId);
    } catch (e) {
      // Handle error
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<Order?> createOrder({
    required String userId,
    required List<OrderItem> items,
    String? deliveryAddress,
    String? phone,
    String? name,
  }) async {
    _isLoading = true;
    notifyListeners();
    try {
      final order = await _apiService.createOrder(
        userId: userId,
        items: items,
        deliveryAddress: deliveryAddress,
        phone: phone,
        name: name,
      );
      _orders.insert(0, order);
      _isLoading = false;
      notifyListeners();
      return order;
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return null;
    }
  }
}
