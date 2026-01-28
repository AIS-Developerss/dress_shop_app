import '../models/product.dart';
import '../models/category.dart';
import '../models/user.dart';
import '../models/order.dart';
import '../models/favorite.dart';

/// Mock API Service - замените на реальный API сервис
/// Для переключения на реальный API просто замените реализацию методов
class MockApiService {
  // ============ AUTH ============
  
  /// POST /api/auth/send-sms
  /// Body: { "phone": "+79991234567" }
  /// Response: { "success": true, "message": "SMS sent" }
  Future<Map<String, dynamic>> sendSms(String phone) async {
    await Future.delayed(const Duration(seconds: 1));
    return {
      'success': true,
      'message': 'SMS sent',
    };
  }

  /// POST /api/auth/verify-sms
  /// Body: { "phone": "+79991234567", "code": "1234" }
  /// Response: { "success": true, "token": "jwt_token", "user": {...} }
  Future<Map<String, dynamic>> verifySms(String phone, String code) async {
    await Future.delayed(const Duration(seconds: 1));
    return {
      'success': true,
      'token': 'mock_jwt_token_${DateTime.now().millisecondsSinceEpoch}',
      'user': {
        'id': 'user_1',
        'name': 'Test User',
        'phone': phone,
      },
    };
  }

  /// POST /api/auth/register
  /// Body: { "name": "Иван", "phone": "+79991234567" }
  /// Response: { "success": true, "message": "Registration successful, SMS sent" }
  Future<Map<String, dynamic>> register(String name, String phone) async {
    await Future.delayed(const Duration(seconds: 1));
    return {
      'success': true,
      'message': 'Registration successful, SMS sent',
    };
  }

  // ============ PRODUCTS ============
  
  /// GET /api/products?categoryId=xxx&search=xxx
  /// Response: { "products": [...] }
  Future<List<Product>> getProducts({String? categoryId, String? search}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockProducts.where((product) {
      if (categoryId != null && product.categoryId != categoryId) return false;
      if (search != null && search.isNotEmpty) {
        final searchLower = search.toLowerCase();
        return product.name.toLowerCase().contains(searchLower) ||
               product.description.toLowerCase().contains(searchLower);
      }
      return true;
    }).toList();
  }

  /// GET /api/products/:id
  /// Response: { "product": {...} }
  Future<Product?> getProduct(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockProducts.firstWhere((p) => p.id == id, orElse: () => _mockProducts.first);
  }

  // ============ CATEGORIES ============
  
  /// GET /api/categories
  /// Response: { "categories": [...] }
  Future<List<Category>> getCategories() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockCategories;
  }

  // ============ FAVORITES ============
  
  /// GET /api/favorites?userId=xxx
  /// Response: { "favorites": [...] }
  Future<List<Favorite>> getFavorites(String userId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockFavorites.where((f) => f.userId == userId).toList();
  }

  /// POST /api/favorites
  /// Body: { "userId": "xxx", "productId": "xxx" }
  /// Response: { "success": true, "favorite": {...} }
  Future<Favorite> addFavorite(String userId, String productId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final favorite = Favorite(
      id: 'fav_${DateTime.now().millisecondsSinceEpoch}',
      userId: userId,
      productId: productId,
    );
    _mockFavorites.add(favorite);
    return favorite;
  }

  /// DELETE /api/favorites/:id
  /// Response: { "success": true }
  Future<bool> removeFavorite(String favoriteId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _mockFavorites.removeWhere((f) => f.id == favoriteId);
    return true;
  }

  // ============ ORDERS ============
  
  /// POST /api/orders
  /// Body: { "userId": "xxx", "items": [...], "deliveryAddress": "...", "phone": "...", "name": "..." }
  /// Response: { "success": true, "order": {...} }
  Future<Order> createOrder({
    required String userId,
    required List<OrderItem> items,
    String? deliveryAddress,
    String? phone,
    String? name,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    final totalPrice = items.fold<double>(
      0,
      (sum, item) => sum + (double.tryParse(item.price) ?? 0) * item.quantity,
    ).toStringAsFixed(2);

    final order = Order(
      id: 'order_${DateTime.now().millisecondsSinceEpoch}',
      userId: userId,
      items: items,
      totalPrice: totalPrice,
      status: 'pending',
      createdAt: DateTime.now(),
      deliveryAddress: deliveryAddress,
      phone: phone,
      name: name,
    );
    _mockOrders.add(order);
    return order;
  }

  /// GET /api/orders?userId=xxx
  /// Response: { "orders": [...] }
  Future<List<Order>> getOrders(String userId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockOrders.where((o) => o.userId == userId).toList();
  }

  /// GET /api/orders/:id
  /// Response: { "order": {...} }
  Future<Order?> getOrder(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockOrders.firstWhere((o) => o.id == id, orElse: () => _mockOrders.first);
  }

  // ============ CONTACT ============
  
  /// POST /api/contact
  /// Body: { "name": "...", "phone": "...", "message": "..." }
  /// Response: { "success": true, "message": "Message sent" }
  Future<Map<String, dynamic>> sendContactMessage({
    required String name,
    required String phone,
    required String message,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return {
      'success': true,
      'message': 'Message sent',
    };
  }

  // ============ MOCK DATA ============
  
  final List<Product> _mockProducts = [
    Product(
      id: '1',
      name: 'Air Jordans',
      price: '14500',
      description: 'У вас есть прыжки и скорость - зашнуруйте обувь, которая усилит то, что вы приносите на площадку',
      imagePaths: ['assets/images/jordan.png', 'assets/images/jordan.png'],
      categoryId: '1',
      characteristics: {
        'Материал': 'Кожа',
        'Подошва': 'Резина',
        'Цвет': 'Черный/Белый',
        'Вес': '350г',
      },
      availableSizes: ['40', '41', '42', '43', '44', '45'],
      stock: 10,
    ),
    Product(
      id: '2',
      name: 'KD Treys',
      price: '20000',
      description: 'Надежный ремешок на средней части стопы идеально подходит для забивания голов и защитных стоек',
      imagePaths: ['assets/images/kdtrey.png', 'assets/images/kdtrey.png'],
      categoryId: '1',
      characteristics: {
        'Материал': 'Синтетика',
        'Подошва': 'Резина',
        'Цвет': 'Красный/Белый',
        'Вес': '320г',
      },
      availableSizes: ['40', '41', '42', '43', '44'],
      stock: 5,
    ),
    Product(
      id: '3',
      name: 'Zoom FREAK',
      price: '21000',
      description: 'Инновационный дизайн его последней фирменной обуви',
      imagePaths: ['assets/images/zoomfreak.png', 'assets/images/zoomfreak.png'],
      categoryId: '1',
      characteristics: {
        'Материал': 'Текстиль',
        'Подошва': 'Резина',
        'Цвет': 'Белый/Синий',
        'Вес': '340г',
      },
      availableSizes: ['39', '40', '41', '42', '43', '44', '45'],
      stock: 8,
    ),
    Product(
      id: '4',
      name: 'Zion 2',
      price: '7000',
      description: 'Достигните новых уровней скорости и силы в обуви, разработанной для Зиона',
      imagePaths: ['assets/images/zion2.png', 'assets/images/zion2.png'],
      categoryId: '1',
      characteristics: {
        'Материал': 'Кожа',
        'Подошва': 'Резина',
        'Цвет': 'Черный/Оранжевый',
        'Вес': '360г',
      },
      availableSizes: ['40', '41', '42', '43', '44'],
      stock: 12,
    ),
  ];

  final List<Category> _mockCategories = [
    Category(id: '1', name: 'Баскетбольные кроссовки'),
    Category(id: '2', name: 'Беговые кроссовки'),
    Category(id: '3', name: 'Повседневные'),
    Category(id: '4', name: 'Классические'),
  ];

  final List<Favorite> _mockFavorites = [];
  final List<Order> _mockOrders = [];
}
