import 'dart:convert';
import 'package:frontend/models/Product.dart';
import 'package:http/http.dart' as http;

class ProductService {
  final String baseUrl = "http://localhost:5267/api/v1/products";

  // Future<List<Product>> getProducts() async {
  //   final response = await http.get(Uri.parse(baseUrl));
  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body);
  //     return data.map<Product>((e) => Product.fromJson(e)).toList();
  //   } else {
  //     throw Exception("Error al buscar productos");
  //   }
  // }

  Future<List<Product>> getProducts(int page) async {
  final response = await http.get(
    Uri.parse("$baseUrl?page=$page&pageSize=10"),
  );

  final data = jsonDecode(response.body);

  return data.map<Product>((e) => Product.fromJson(e)).toList();
}

  Future<List<Product>> searchProducts(String query) async {
    final response = await http.get(
      Uri.parse("$baseUrl/search?query=$query"),
    );

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception("Error al buscar productos");
    }
  }

  Future<void> updatePrice(int id, double price) async {
  final response = await http.patch(
    Uri.parse("$baseUrl/$id/price"),
    headers: {
      "Content-Type": "application/json",
    },
    body: jsonEncode({
      "price": price
    }),
  );

  if (response.statusCode != 200) {
    throw Exception("Error al actualizar precio");
  }
}
  
  
}