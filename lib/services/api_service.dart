import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';
import '../models/category.dart';
import '../models/order.dart';
import '../models/favorite.dart';

/// Реальный API Service - раскомментируйте и используйте когда бэкенд готов
/// Для переключения с моков на реальный API просто замените MockApiService на ApiService в main.dart
class ApiService {
  final String baseUrl;
  String? _token;

  ApiService({this.baseUrl = 'https://your-api-domain.com/api'});

  void setToken(String token) {
    _token = token;
  }

  Map<String, String> get _headers => {
        'Content-Type': 'application/json',
        if (_token != null) 'Authorization': 'Bearer $_token',
      };

  // ============ AUTH ============
  
  Future<Map<String, dynamic>> sendSms(String phone) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/send-sms'),
      headers: _headers,
      body: jsonEncode({'phone': phone}),
    );
    return jsonDecode(response.body) as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> verifySms(String phone, String code) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/verify-sms'),
      headers: _headers,
      body: jsonEncode({'phone': phone, 'code': code}),
    );
    return jsonDecode(response.body) as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> register(String name, String phone) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/register'),
      headers: _headers,
      body: jsonEncode({'name': name, 'phone': phone}),
    );
    return jsonDecode(response.body) as Map<String, dynamic>;
  }

  // ============ PRODUCTS ============
  
  Future<List<Product>> getProducts({String? categoryId, String? search}) async {
    final queryParams = <String, String>{};
    if (categoryId != null) queryParams['categoryId'] = categoryId;
    if (search != null && search.isNotEmpty) queryParams['search'] = search;

    final uri = Uri.parse('$baseUrl/products').replace(queryParameters: queryParams);
    final response = await http.get(uri, headers: _headers);
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    return (data['products'] as List)
        .map((json) => Product.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<Product?> getProduct(String id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/products/$id'),
      headers: _headers,
    );
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    return Product.fromJson(data['product'] as Map<String, dynamic>);
  }

  // ============ CATEGORIES ============
  
  Future<List<Category>> getCategories() async {
    final response = await http.get(
      Uri.parse('$baseUrl/categories'),
      headers: _headers,
    );
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    return (data['categories'] as List)
        .map((json) => Category.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  // ============ FAVORITES ============
  
  Future<List<Favorite>> getFavorites(String userId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/favorites').replace(queryParameters: {'userId': userId}),
      headers: _headers,
    );
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    return (data['favorites'] as List)
        .map((json) => Favorite.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<Favorite> addFavorite(String userId, String productId) async {
    final response = await http.post(
      Uri.parse('$baseUrl/favorites'),
      headers: _headers,
      body: jsonEncode({'userId': userId, 'productId': productId}),
    );
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    return Favorite.fromJson(data['favorite'] as Map<String, dynamic>);
  }

  Future<bool> removeFavorite(String favoriteId) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/favorites/$favoriteId'),
      headers: _headers,
    );
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    return data['success'] as bool;
  }

  // ============ ORDERS ============
  
  Future<Order> createOrder({
    required String userId,
    required List<OrderItem> items,
    String? deliveryAddress,
    String? phone,
    String? name,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/orders'),
      headers: _headers,
      body: jsonEncode({
        'userId': userId,
        'items': items.map((item) => item.toJson()).toList(),
        'deliveryAddress': deliveryAddress,
        'phone': phone,
        'name': name,
      }),
    );
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    return Order.fromJson(data['order'] as Map<String, dynamic>);
  }

  Future<List<Order>> getOrders(String userId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/orders').replace(queryParameters: {'userId': userId}),
      headers: _headers,
    );
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    return (data['orders'] as List)
        .map((json) => Order.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<Order?> getOrder(String id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/orders/$id'),
      headers: _headers,
    );
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    return Order.fromJson(data['order'] as Map<String, dynamic>);
  }

  // ============ CONTACT ============
  
  Future<Map<String, dynamic>> sendContactMessage({
    required String name,
    required String phone,
    required String message,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/contact'),
      headers: _headers,
      body: jsonEncode({
        'name': name,
        'phone': phone,
        'message': message,
      }),
    );
    return jsonDecode(response.body) as Map<String, dynamic>;
  }
}
