import '../models/product.dart';
import '../models/category.dart';
import '../models/order.dart';
import '../models/favorite.dart';

/// Общий интерфейс для API (REST, gRPC или mock).
/// Реализации: [MockApiService], [GrpcApiService], [ApiService].
abstract class ApiClient {
  /// Передать JWT для авторизованных запросов (используется gRPC/REST).
  void setToken(String? token) {}

  // ============ AUTH ============
  Future<Map<String, dynamic>> sendSms(String phone);
  Future<Map<String, dynamic>> verifySms(String phone, String code);
  Future<Map<String, dynamic>> register(String name, String phone);

  // ============ PRODUCTS ============
  Future<List<Product>> getProducts({String? categoryId, String? search});
  Future<Product?> getProduct(String id);

  // ============ CATEGORIES ============
  Future<List<Category>> getCategories();

  // ============ FAVORITES ============
  Future<List<Favorite>> getFavorites(String userId);
  Future<Favorite> addFavorite(String userId, String productId);
  Future<bool> removeFavorite(String favoriteId);

  // ============ ORDERS ============
  Future<Order> createOrder({
    required String userId,
    required List<OrderItem> items,
    String? deliveryAddress,
    String? phone,
    String? name,
  });
  Future<List<Order>> getOrders(String userId);
  Future<Order?> getOrder(String id);

  // ============ CONTACT ============
  Future<Map<String, dynamic>> sendContactMessage({
    required String name,
    required String phone,
    required String message,
  });
}
