Muhammad Rizky Febrianto | 2409116045

# **Shopping Cart System**
Aplikasi ini saya buat menggunakan Flutter dengan state management Provider. Fungsinya sederhana, yaitu untuk simulasi sistem keranjang belanja.

## 1. main.dart
Di file ini saya membungkus aplikasi dengan `ChangeNotifierProvider`.
```
ChangeNotifierProvider(
  create: (context) => CartModel(),
  child: const MyApp(),
)
```
Tujuannya supaya `CartModel` bisa diakses dari semua halaman. Jadi data cart bisa dipakai di product page, cart page, dan checkout page.
Halaman pertama yang ditampilkan adalah `ProductListPage`.

## 2. Model
### product.dart
File ini berisi class Product yang menyimpan data produk seperti:
- id
- nama
- harga
- emoji (sebagai gambar sederhana)
- deskripsi
- kategori

Class ini hanya sebagai struktur data saja.

### cart_item.dart
Class CartItem digunakan untuk menyimpan:
- produk
- jumlah (quantity)
Di sini juga ada getter:
```
double get totalPrice => product.price * quantity;
```
Jadi total harga tiap item dihitung otomatis.
