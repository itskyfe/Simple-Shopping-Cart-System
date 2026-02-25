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

## 2. model
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

### cart_model.dart

Ini bagian paling penting karena mengatur semua logic cart.

Saya menggunakan:

```
Map<String, CartItem> _items = {};
```

Saya pakai Map supaya:

- Tidak ada produk yang dobel

- Lebih mudah update quantity berdasarkan id

Di dalamnya ada beberapa fungsi:

- `addItem()` → menambah produk
- `removeItem()` → menghapus produk
- `increaseQuantity()` → tambah jumlah
- `decreaseQuantity()` → kurangi jumlah
- `clear()` → kosongkan cart
- 
Setiap ada perubahan, saya panggil:

```
notifyListeners();
```

Supaya tampilan otomatis update.

## 3. Product List Page

Ini halaman utama yang menampilkan daftar produk dalam bentuk GridView.

Fitur yang ada di halaman ini:

#### Search
User bisa mencari produk berdasarkan nama.

Logikanya:

```
product.name.toLowerCase().contains(searchQuery.toLowerCase())
```

Jadi kalau nama produk mengandung kata yang diketik, produk akan tampil.

#### Filter Kategori
Saya menambahkan dropdown untuk memilih kategori.

Kalau kategori “All”, maka semua produk tampil.  
Kalau pilih kategori tertentu, maka hanya produk dengan kategori tersebut yang tampil.

#### Add to Cart
Saat tombol Add ditekan:
```
context.read<CartModel>().addItem(product);
```
Produk langsung masuk ke cart.

Saya juga pakai `Consumer<CartModel>` untuk badge jumlah cart supaya update otomatis.

## 4. Cart Page

Di halaman ini user bisa melihat isi keranjang.

Yang bisa dilakukan:

- Tambah jumlah barang
- Kurangi jumlah
- Hapus barang
- Clear semua barang

Total harga diambil dari:
```
cart.totalPrice
```
Nilainya otomatis berubah karena dihitung dari semua item di cart.

## 5. Checkout Page
Di halaman ini ada:

- Ringkasan pesanan (order summary)
- Total harga
- Form data pelanggan

Form berisi:
- Nama
- Email
- Alamat
Saya menggunakan Form dan `GlobalKey<FormState>` untuk validasi.

Kalau semua field terisi dengan benar:
- Cart dikosongkan
- Muncul dialog sukses

## Tampilan sistem
### Tampilan Utama

<img width="242" height="459" alt="image" src="https://github.com/user-attachments/assets/eee7040f-6ed3-479b-8b1b-2460f359a9bd" />

### Fitur Filter

<img width="243" height="446" alt="image" src="https://github.com/user-attachments/assets/63164e30-30da-4044-b27b-334233e08991" />

### Fitur Search

<img width="244" height="445" alt="image" src="https://github.com/user-attachments/assets/dda54291-95a8-4c97-9c61-c51ee5787c21" />

### Fitur Cart

<img width="245" height="539" alt="image" src="https://github.com/user-attachments/assets/ce73a3bc-5664-4821-8e00-26d59ace4a55" />


