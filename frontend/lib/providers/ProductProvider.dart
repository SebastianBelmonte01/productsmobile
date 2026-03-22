import 'package:flutter/material.dart';
import 'package:frontend/models/Product.dart';
import 'package:frontend/services/ProductService.dart';

class ProductProvider extends ChangeNotifier {
  final ProductService _service = ProductService();

  List<Product> products = [];
  List<Product> searchResults = [];

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

  Future<void> search(String query) async {
    if (query.isEmpty) {
      searchResults = [];
      notifyListeners();
      return;
    }

    try {
      isLoading = true;
      notifyListeners();

      searchResults = await _service.searchProducts(query);
    } catch (e) {
      error = "No se encontraron productos";
    }

    isLoading = false;
    notifyListeners();
  }

  void clearSearch() {
    searchResults = [];
    notifyListeners();
  }


  Future<bool> updatePrice(int id, double price) async {
    try {
      await _service.updatePrice(id, price);
      return true;
    } catch (e) {
      return false;
    }
  }
}