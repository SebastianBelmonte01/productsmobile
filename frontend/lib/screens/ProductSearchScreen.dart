import 'package:flutter/material.dart';
import 'package:frontend/providers/ProductProvider.dart';
import 'package:provider/provider.dart';

class ProductSearchScreen extends StatefulWidget {
  @override
  _ProductSearchScreenState createState() =>
      _ProductSearchScreenState();
}

class _ProductSearchScreenState extends State<ProductSearchScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductProvider>();

    return Scaffold(
      appBar: AppBar(title: Text("Buscar productos")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              autofocus: true,
              decoration: InputDecoration(
                hintText: "Buscar por nombre o SKU",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                context.read<ProductProvider>().search(value);
              },
            ),
          ),

          Expanded(
            child: Builder(
              builder: (_) {
                if (provider.isLoading) {
                  return Center(child: CircularProgressIndicator());
                }

                if (provider.error != null) {
                  return Center(child: Text(provider.error!));
                }

                if (provider.products.isEmpty) {
                  return Center(child: Text("Sin resultados"));
                }

                return ListView.builder(
                  itemCount: provider.searchResults.length,
                  itemBuilder: (context, index) {
                    final product = provider.searchResults[index];

                    return ListTile(
                      title: Text(product.name),
                      subtitle: Text(product.sku),
                      trailing: Text(
                        "${product.price} ${product.currency}",
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "/edit",
                          arguments: product,
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}