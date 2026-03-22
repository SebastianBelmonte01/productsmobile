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
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }

  void clearSearch() {
    searchResults = [];
    notifyListeners();
  }


  Future<void> updatePrice(int id, double price) async {
    try {
      isLoading = true;
      notifyListeners();

      await _service.updatePrice(id, price);
      final index = products.indexWhere((p) => p.id == id);
      if (index != -1) {
        products[index] = Product(
          id: products[index].id,
          name: products[index].name,
          sku: products[index].sku,
          price: price,
          currency: products[index].currency,
          stock: products[index].stock,
        );
      }
      final searchIndex = searchResults.indexWhere((p) => p.id == id);
      if (searchIndex != -1) {
        searchResults[searchIndex] = Product(
          id: searchResults[searchIndex].id,
          name: searchResults[searchIndex].name,
          sku: searchResults[searchIndex].sku,
          price: price,
          currency: searchResults[searchIndex].currency,
          stock: searchResults[searchIndex].stock,
        );
      }

    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}