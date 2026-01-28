import 'package:flutter/material.dart';
import '../models/product.dart';
import '../models/category.dart';
import '../services/mock_api_service.dart';

class ProductsProvider extends ChangeNotifier {
  final MockApiService _apiService = MockApiService();
  List<Product> _products = [];
  List<Category> _categories = [];
  String? _selectedCategoryId;
  String _searchQuery = '';
  bool _isLoading = false;

  List<Product> get products => _products;
  List<Category> get categories => _categories;
  String? get selectedCategoryId => _selectedCategoryId;
  String get searchQuery => _searchQuery;
  bool get isLoading => _isLoading;

  Future<void> loadProducts() async {
    // Показываем лоадер только при первой загрузке (когда списка ещё нет)
    final isFirstLoad = _products.isEmpty;
    if (isFirstLoad) {
      _isLoading = true;
      notifyListeners();
    }
    try {
      _products = await _apiService.getProducts(
        categoryId: _selectedCategoryId,
        search: _searchQuery.isEmpty ? null : _searchQuery,
      );
    } catch (e) {
      // Handle error
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> loadCategories() async {
    try {
      _categories = await _apiService.getCategories();
      notifyListeners();
    } catch (e) {
      // Handle error
    }
  }

  void setCategory(String? categoryId) {
    _selectedCategoryId = categoryId;
    loadProducts();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    loadProducts();
  }

  Future<Product?> getProduct(String id) async {
    try {
      return await _apiService.getProduct(id);
    } catch (e) {
      return null;
    }
  }
}
