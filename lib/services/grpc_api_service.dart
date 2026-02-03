import 'package:grpc/grpc.dart';
import 'package:dress_shop_app/generated/api.pb.dart' as pb;
import 'package:dress_shop_app/generated/api.pbgrpc.dart' as grpc;

import '../models/product.dart';
import '../models/category.dart';
import '../models/order.dart';
import '../models/favorite.dart';
import 'api_client.dart';

/// gRPC-реализация [ApiClient].
/// Подключается к бэкенду по host:port и вызывает методы через gRPC.
class GrpcApiService extends ApiClient {
  final String host;
  final int port;
  final bool useTls;
  late final ClientChannel _channel;
  late final grpc.AuthServiceClient _authClient;
  late final grpc.ProductServiceClient _productClient;
  late final grpc.CategoryServiceClient _categoryClient;
  late final grpc.FavoriteServiceClient _favoriteClient;
  late final grpc.OrderServiceClient _orderClient;
  late final grpc.ContactServiceClient _contactClient;

  String? _token;

  GrpcApiService({
    this.host = 'localhost',
    this.port = 50051,
    this.useTls = false,
  }) {
    _channel = ClientChannel(
      host,
      port: port,
      options: ChannelOptions(
        credentials: useTls
            ? ChannelCredentials.secure()
            : ChannelCredentials.insecure(),
      ),
    );
    _authClient = grpc.AuthServiceClient(_channel);
    _productClient = grpc.ProductServiceClient(_channel);
    _categoryClient = grpc.CategoryServiceClient(_channel);
    _favoriteClient = grpc.FavoriteServiceClient(_channel);
    _orderClient = grpc.OrderServiceClient(_channel);
    _contactClient = grpc.ContactServiceClient(_channel);
  }

  @override
  void setToken(String? token) {
    _token = token;
  }

  CallOptions get _options {
    if (_token == null) return CallOptions();
    return CallOptions(metadata: {'authorization': 'Bearer $_token'});
  }

  // ============ Auth ============

  @override
  Future<Map<String, dynamic>> sendSms(String phone) async {
    final req = pb.SendSmsRequest()..phone = phone;
    final res = await _authClient.sendSms(req, options: _options);
    return {'success': res.success, 'message': res.message};
  }

  @override
  Future<Map<String, dynamic>> verifySms(String phone, String code) async {
    final req = pb.VerifySmsRequest()
      ..phone = phone
      ..code = code;
    final res = await _authClient.verifySms(req, options: _options);
    final map = <String, dynamic>{
      'success': res.success,
      'token': res.token,
    };
    if (res.hasUser()) {
      map['user'] = _userToJson(res.user);
    }
    return map;
  }

  @override
  Future<Map<String, dynamic>> register(String name, String phone) async {
    final req = pb.RegisterRequest()
      ..name = name
      ..phone = phone;
    final res = await _authClient.register(req, options: _options);
    return {'success': res.success, 'message': res.message};
  }

  // ============ Products ============

  @override
  Future<List<Product>> getProducts({String? categoryId, String? search}) async {
    final req = pb.GetProductsRequest();
    if (categoryId != null && categoryId.isNotEmpty) req.categoryId = categoryId;
    if (search != null && search.isNotEmpty) req.search = search;
    final res = await _productClient.getProducts(req, options: _options);
    return res.products.map(_productFromProto).toList();
  }

  @override
  Future<Product?> getProduct(String id) async {
    final req = pb.GetProductRequest()..id = id;
    final res = await _productClient.getProduct(req, options: _options);
    if (!res.hasProduct()) return null;
    return _productFromProto(res.product);
  }

  // ============ Categories ============

  @override
  Future<List<Category>> getCategories() async {
    final req = pb.GetCategoriesRequest();
    final res = await _categoryClient.getCategories(req, options: _options);
    return res.categories.map(_categoryFromProto).toList();
  }

  // ============ Favorites ============

  @override
  Future<List<Favorite>> getFavorites(String userId) async {
    final req = pb.GetFavoritesRequest()..userId = userId;
    final res = await _favoriteClient.getFavorites(req, options: _options);
    return res.favorites.map(_favoriteFromProto).toList();
  }

  @override
  Future<Favorite> addFavorite(String userId, String productId) async {
    final req = pb.AddFavoriteRequest()
      ..userId = userId
      ..productId = productId;
    final res = await _favoriteClient.addFavorite(req, options: _options);
    return _favoriteFromProto(res.favorite);
  }

  @override
  Future<bool> removeFavorite(String favoriteId) async {
    final req = pb.RemoveFavoriteRequest()..favoriteId = favoriteId;
    final res = await _favoriteClient.removeFavorite(req, options: _options);
    return res.success;
  }

  // ============ Orders ============

  @override
  Future<Order> createOrder({
    required String userId,
    required List<OrderItem> items,
    String? deliveryAddress,
    String? phone,
    String? name,
  }) async {
    final req = pb.CreateOrderRequest()..userId = userId;
    for (final item in items) {
      req.items.add(_orderItemToProto(item));
    }
    if (deliveryAddress != null) req.deliveryAddress = deliveryAddress;
    if (phone != null) req.phone = phone;
    if (name != null) req.name = name;
    final res = await _orderClient.createOrder(req, options: _options);
    return _orderFromProto(res.order);
  }

  @override
  Future<List<Order>> getOrders(String userId) async {
    final req = pb.GetOrdersRequest()..userId = userId;
    final res = await _orderClient.getOrders(req, options: _options);
    return res.orders.map(_orderFromProto).toList();
  }

  @override
  Future<Order?> getOrder(String id) async {
    final req = pb.GetOrderRequest()..id = id;
    final res = await _orderClient.getOrder(req, options: _options);
    if (!res.hasOrder()) return null;
    return _orderFromProto(res.order);
  }

  // ============ Contact ============

  @override
  Future<Map<String, dynamic>> sendContactMessage({
    required String name,
    required String phone,
    required String message,
  }) async {
    final req = pb.SendContactMessageRequest()
      ..name = name
      ..phone = phone
      ..message = message;
    final res = await _contactClient.sendContactMessage(req, options: _options);
    return {'success': res.success, 'message': res.message};
  }

  // ============ Mappers: proto -> domain ============

  Map<String, dynamic> _userToJson(pb.User u) => {
        'id': u.id,
        'name': u.name,
        'phone': u.phone,
        'email': u.email.isEmpty ? null : u.email,
      };

  Product _productFromProto(pb.Product p) {
    return Product(
      id: p.id,
      name: p.name,
      price: p.price,
      description: p.description,
      imagePaths: p.imagePaths.toList(),
      categoryId: p.categoryId,
      characteristics: Map<String, dynamic>.from(p.characteristics),
      availableSizes: p.availableSizes.toList(),
      stock: p.stock,
    );
  }

  Category _categoryFromProto(pb.Category c) {
    return Category(
      id: c.id,
      name: c.name,
      icon: c.icon.isEmpty ? null : c.icon,
    );
  }

  Favorite _favoriteFromProto(pb.Favorite f) {
    return Favorite(
      id: f.id,
      userId: f.userId,
      productId: f.productId,
    );
  }

  OrderItem _orderItemFromProto(pb.OrderItem o) {
    return OrderItem(
      productId: o.productId,
      productName: o.productName,
      size: o.size,
      quantity: o.quantity,
      price: o.price,
      imagePath: o.imagePath,
    );
  }

  pb.OrderItem _orderItemToProto(OrderItem item) {
    return pb.OrderItem()
      ..productId = item.productId
      ..productName = item.productName
      ..size = item.size
      ..quantity = item.quantity
      ..price = item.price
      ..imagePath = item.imagePath;
  }

  Order _orderFromProto(pb.Order o) {
    return Order(
      id: o.id,
      userId: o.userId,
      items: o.items.map(_orderItemFromProto).toList(),
      totalPrice: o.totalPrice,
      status: o.status,
      createdAt: DateTime.tryParse(o.createdAt) ?? DateTime.now(),
      deliveryAddress: o.deliveryAddress.isEmpty ? null : o.deliveryAddress,
      phone: o.phone.isEmpty ? null : o.phone,
      name: o.name.isEmpty ? null : o.name,
    );
  }
}
