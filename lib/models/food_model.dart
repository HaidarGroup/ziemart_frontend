import 'package:ziemart_frontend/config/app_asset.dart';

class FoodModel {
  final String img;
  final String nama;
  final String toko;
  final String harga;
  final String rating;
  final String deskripsi;

  FoodModel({required this.img, required this.nama, required this.toko, required this.harga, required this.rating, required this.deskripsi});
}

final List<FoodModel> itemFood = [
  FoodModel(
    img: AppAssets.food1,
    nama: 'Makanan 1',
    toko: 'Tokopedia',
    harga: 'Rp. 5000',
    rating: '4.5',
    deskripsi: 'lorem ipsum dolor sit amet consectetur adipisicing elit. Quos, doloremque.',
  ),
  FoodModel(
    img: AppAssets.food2,
    nama: 'Makanan 2',
    toko: 'Tokopedia',
    harga: 'Rp. 6000',
    rating: '4.6',
    deskripsi: 'lorem ipsum dolor sit amet consectetur adipisicing elit. Quos, doloremque.',
  ),
  FoodModel(
    img: AppAssets.food3,
    nama: 'Makanan 3',
    toko: 'Tokopedia',
    harga: 'Rp. 3000',
    rating: '4.7',
    deskripsi: 'lorem ipsum dolor sit amet consectetur adipisicing elit. Quos, doloremque.',
  ),
  FoodModel(
    img: AppAssets.food4,
    nama: 'Makanan 4',
    toko: 'Tokopedia',
    harga: 'Rp. 7000',
    rating: '4.8',
    deskripsi: 'lorem ipsum dolor sit amet consectetur adipisicing elit. Quos, doloremque.',
  ),
  FoodModel(
    img: AppAssets.food5,
    nama: 'Makanan 5',
    toko: 'Tokopedia',
    harga: 'Rp. 9000',
    rating: '4.9',
    deskripsi: 'lorem ipsum dolor sit amet consectetur adipisicing elit. Quos, doloremque.',
  ),
  FoodModel(
    img: AppAssets.food6,
    nama: 'Makanan 6',
    toko: 'Tokopedia',
    harga: 'Rp. 10000',
    rating: '4.1',
    deskripsi: 'lorem ipsum dolor sit amet consectetur adipisicing elit. Quos, doloremque.',
  ),
];