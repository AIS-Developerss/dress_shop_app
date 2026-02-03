import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/api_client.dart';

class AuthProvider extends ChangeNotifier {
  final ApiClient _apiService;

  AuthProvider(this._apiService);
  User? _user;
  String? _token;
  bool _isLoading = false;

  User? get user => _user;
  String? get token => _token;
  bool get isAuthenticated => _user != null;
  bool get isLoading => _isLoading;

  Future<bool> register(String name, String phone) async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await _apiService.register(name, phone);
      _isLoading = false;
      notifyListeners();
      return response['success'] == true;
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> sendSms(String phone) async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await _apiService.sendSms(phone);
      _isLoading = false;
      notifyListeners();
      return response['success'] == true;
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> verifySms(String phone, String code) async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await _apiService.verifySms(phone, code);
      if (response['success'] == true) {
        _token = response['token'] as String;
        _user = User.fromJson(response['user'] as Map<String, dynamic>);
        _apiService.setToken(_token);
        _isLoading = false;
        notifyListeners();
        return true;
      }
      _isLoading = false;
      notifyListeners();
      return false;
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  void logout() {
    _user = null;
    _token = null;
    _apiService.setToken(null);
    notifyListeners();
  }
}
