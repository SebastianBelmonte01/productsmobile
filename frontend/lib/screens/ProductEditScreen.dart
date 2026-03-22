import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/Product.dart';
import '../providers/ProductProvider.dart';

class ProductEditScreen extends StatefulWidget {
  final Product product;

  ProductEditScreen({required this.product});

  @override
  _ProductEditScreenState createState() => _ProductEditScreenState();
}

class _ProductEditScreenState extends State<ProductEditScreen> {
  late TextEditingController priceController;

  @override
  void initState() {
    super.initState();
    priceController =
        TextEditingController(text: widget.product.price.toString());
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductProvider>();

    return Scaffold(
      appBar: AppBar(title: Text("Editar Precio")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(widget.product.name,
                style: TextStyle(fontSize: 18)),

            SizedBox(height: 10),

            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Precio",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            if (provider.isLoading)
              CircularProgressIndicator()
            else
              ElevatedButton(
                onPressed: () async {
                  final newPrice = double.tryParse(priceController.text);

                  if (newPrice == null) return;

                  final success = await context
                      .read<ProductProvider>()
                      .updatePrice(widget.product.id, newPrice);

                  if (!success) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("El precio debe ser mayor a 0")),
                    );

                    await context.read<ProductProvider>().fetchProducts();

                    Navigator.pop(context); // volver
                    return;
                  } else {
                    await context.read<ProductProvider>().fetchProducts();
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Precio actualizado")),
                  );

                  Navigator.pop(context);
                },
                child: Text("Guardar"),
              ),
          ],
        ),
      ),
    );
  }
}