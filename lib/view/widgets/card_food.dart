import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CardFood extends StatelessWidget {
  final String img;
  final String nama;
  final String toko;
  final String harga;
  final String rating;

  const CardFood({
    super.key,
    required this.img,
    required this.nama,
    required this.toko,
    required this.harga,
    required this.rating,
  });


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        color: Colors.white,
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: const BorderRadiusDirectional.only(topStart: Radius.circular(15), topEnd: Radius.circular(15)),
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.asset(img, fit: BoxFit.cover,)),
              )
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(nama, style: const TextStyle(fontWeight: FontWeight.bold),),
                    const Gap(5),
                    Text(toko, style: const TextStyle(fontWeight: FontWeight.bold),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(harga),
                        Row(
                          children: [
                            const Icon(Icons.star, size: 15, color: Colors.amber,),
                            const Gap(2),
                            Text(rating),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}