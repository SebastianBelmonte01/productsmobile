import 'package:flutter/material.dart';
import 'package:frontend/models/Product.dart';
import 'package:frontend/services/ProductService.dart';

class ProductProvider extends ChangeNotifier {
  final ProductService _service = ProductService();

  List<Product> products = [];
  bool isLoading = false;
  String? error;

  Future<void> fetchProducts() async {
    isLoading = true;
    notifyListeners();

    try {
      products = await _service.getProducts();
      error = null;
    } catch (e) {
      error = "Error al cargar productos";
    }

    isLoading = false;
    notifyListeners();
  }
}