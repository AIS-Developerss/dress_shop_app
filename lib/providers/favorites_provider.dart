import 'package:flutter/material.dart';
import '../models/favorite.dart';
import '../models/product.dart';
import '../services/mock_api_service.dart';

class FavoritesProvider extends ChangeNotifier {
  final MockApiService _apiService = MockApiService();
  List<Favorite> _favorites = [];
  List<Product> _favoriteProducts = [];
  bool _isLoading = false;

  List<Favorite> get favorites => _favorites;
  List<Product> get favoriteProducts => _favoriteProducts;
  bool get isLoading => _isLoading;

  Future<void> loadFavorites(String userId) async {
    // Показываем лоадер только при первой загрузке (когда списка ещё нет)
    final isFirstLoad = _favoriteProducts.isEmpty && _favorites.isEmpty;
    if (isFirstLoad) {
      _isLoading = true;
      notifyListeners();
    }
    try {
      _favorites = await _apiService.getFavorites(userId);
      // Загружаем продукты для избранного
      final allProducts = await _apiService.getProducts();
      _favoriteProducts = allProducts
          .where((p) => _favorites.any((f) => f.productId == p.id))
          .toList();
    } catch (e) {
      // Handle error
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<bool> addFavorite(String userId, String productId) async {
    try {
      final favorite = await _apiService.addFavorite(userId, productId);
      _favorites.add(favorite);
      final product = await _apiService.getProduct(productId);
      if (product != null && !_favoriteProducts.any((p) => p.id == productId)) {
        _favoriteProducts.add(product);
      }
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> removeFavorite(String favoriteId, String productId) async {
    try {
      final success = await _apiService.removeFavorite(favoriteId);
      if (success) {
        _favorites.removeWhere((f) => f.id == favoriteId);
        _favoriteProducts.removeWhere((p) => p.id == productId);
        notifyListeners();
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  bool isFavorite(String productId) {
    return _favorites.any((f) => f.productId == productId);
  }

  String? getFavoriteId(String productId) {
    try {
      return _favorites.firstWhere((f) => f.productId == productId).id;
    } catch (e) {
      return null;
    }
  }
}
