import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/ProductProvider.dart';
import 'screens/ProductListScreen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ProductProvider()..fetchProducts(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductListScreen(),
    );
  }
}