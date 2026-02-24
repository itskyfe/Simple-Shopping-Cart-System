// lib/models/product.dart
class Product {
  final String id;
  final String name;
  final double price;
  final String emoji;      // ← Emoji sebagai gambar produk (offline-friendly!)
  final String description;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.emoji,
    required this.description,
  });
}