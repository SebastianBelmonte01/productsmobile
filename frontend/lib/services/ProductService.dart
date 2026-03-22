import 'dart:convert';
import 'package:frontend/models/Product.dart';
import 'package:http/http.dart' as http;

class ProductService {
  final String baseUrl = "http://localhost:5267/api/v1/products";

  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data.map<Product>((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception("Error loading products");
    }
  }
}