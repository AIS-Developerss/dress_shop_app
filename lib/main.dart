import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dress_shop_app/pages/intro_page.dart';
import 'models/cart.dart';
import 'providers/auth_provider.dart';
import 'providers/products_provider.dart';
import 'providers/favorites_provider.dart';
import 'providers/orders_provider.dart';
import 'pages/home_page.dart';
import 'pages/auth_page.dart';
import 'pages/favorites_page.dart';
import 'pages/orders_history_page.dart';
import 'pages/contact_page.dart';
import 'pages/checkout_page.dart';
import 'pages/order_success_page.dart';
import 'services/api_client.dart';
import 'services/mock_api_service.dart';
// import 'services/grpc_api_service.dart'; // для gRPC: раскомментировать и использовать ниже

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Переключение API: MockApiService() — моки; GrpcApiService(host: '...', port: 50051) — gRPC
    final ApiClient apiClient = MockApiService();

    return MultiProvider(
      providers: [
        Provider<ApiClient>.value(value: apiClient),
        ChangeNotifierProvider(create: (context) => Cart()),
        ChangeNotifierProvider(create: (context) => AuthProvider(context.read<ApiClient>())),
        ChangeNotifierProvider(create: (context) => ProductsProvider(context.read<ApiClient>())),
        ChangeNotifierProvider(create: (context) => FavoritesProvider(context.read<ApiClient>())),
        ChangeNotifierProvider(create: (context) => OrdersProvider(context.read<ApiClient>())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const IntroPage(),
          '/home': (context) => const HomePage(),
          '/auth': (context) => const AuthPage(),
          '/favorites': (context) => const FavoritesPage(),
          '/orders': (context) => const OrdersHistoryPage(),
          '/contact': (context) => const ContactPage(),
          '/checkout': (context) => const CheckoutPage(),
          '/order-success': (context) => const OrderSuccessPage(),
        },
      ),
    );
  }
}
