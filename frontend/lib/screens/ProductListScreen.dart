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
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollInfo) {
          if (!provider.isLoadingMore &&
              provider.hasMore &&
              scrollInfo.metrics.pixels ==
                  scrollInfo.metrics.maxScrollExtent) {

            context.read<ProductProvider>().fetchProducts(loadMore: true);
          }
          return false;
        },
        child: Builder(
          builder: (_) {
            if (provider.isLoading && provider.products.isEmpty) {
              return Center(child: CircularProgressIndicator());
            }

            if (provider.error != null) {
              return Center(child: Text("Error al cargar productos"));
            }

            return ListView.builder(
              itemCount: provider.products.length +
                  (provider.hasMore ? 1 : 0),

              itemBuilder: (context, index) {
                if (index < provider.products.length) {
                  final product = provider.products[index];

                  return ListTile(
                    title: Text(product.name),
                    subtitle: Text(product.sku),
                    trailing: Text("${product.price} ${product.currency}"),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        "/edit",
                        arguments: product,
                      );
                    },
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}