import 'package:flutter/material.dart';
import 'package:frontend/models/Product.dart';
import 'package:frontend/screens/ProductEditScreen.dart';
import 'package:frontend/screens/ProductListScreen.dart';
import 'package:frontend/screens/ProductSearchScreen.dart';

class AppRouter {
  static const String home = "/";
  static const String search = "/search";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => ProductListScreen());

      case search:
        return MaterialPageRoute(builder: (_) => ProductSearchScreen());

      case "/edit":
      final product = settings.arguments as Product;
      return MaterialPageRoute(
        builder: (_) => ProductEditScreen(product: product),
      );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text("Página no encontrada")),
          ),
        );
    }
  }
}