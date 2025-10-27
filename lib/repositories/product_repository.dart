
  import '../services/api_service.dart';
  import '../models/product_model.dart';

  class ProductRepository {
    final ApiService _api = ApiService();

    Future<List<Product>> getProducts() async {
      try {
        final response = await _api.get("getProducts");

        // jadi dari api laravel itu harus udah ada key data
        // jadi response dari laravel itu harusny ada key data
        final List<dynamic> productsJson = response['data'];

        // di sini kita akn mapping data dari json, lalu kita buat 
        // dia menjadi list
        return productsJson.map((json) => Product.fromJson(json)).toList();
        
      } catch (e) {
        // Lemparkan kembali (rethrow) error untuk ditangani di layer UI/BLoC
        rethrow;
      }
    }


    Future<Product> getProductById(int productId) async {
      try {
        final response = await _api.get("products/$productId");
        
        // Asumsikan respons sukses langsung mengembalikan objek produk di root
        return Product.fromJson(response); 
        
      } catch (e) {
        rethrow;
      }
    }
  }