import 'package:flutter/material.dart';
import 'package:frontend/providers/ProductProvider.dart';
import 'package:frontend/routes/app_router.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductProvider>();

    return Scaffold(
      appBar: AppBar(
      title: Text("Productos"),
      actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, AppRouter.search);
            },
          )
        ],
      ),
      body: Builder(
        builder: (_) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (provider.error != null) {
            return Center(child: Text(provider.error!));
          }

          return ListView.builder(
            itemCount: provider.products.length,
            itemBuilder: (context, index) {
              final product = provider.products[index];

              return ListTile(
                title: Text(product.name),
                subtitle: Text(product.sku),
                trailing: Text("${product.price} ${product.currency}"),
              );
            },
          );
        },
      ),
    );
  }
}