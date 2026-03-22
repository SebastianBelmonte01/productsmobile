class Product {
  final int id;
  final String name;
  final String sku;
  final double price;
  final String currency;
  final int stock;

  Product({
    required this.id,
    required this.name,
    required this.sku,
    required this.price,
    required this.currency,
    required this.stock,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      sku: json['sku'],
      price: json['price'].toDouble(),
      currency: json['currency'],
      stock: json['stock'],
    );
  }
}
