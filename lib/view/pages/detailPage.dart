import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ziemart_frontend/controllers/food_controller.dart';
import 'package:ziemart_frontend/models/food_model.dart';

class DetailPage extends StatelessWidget {
  
  final FoodModel item;

  DetailPage({super.key, required this.item});

  final FoodController foodController = Get.put(FoodController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Image
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: Image.asset(item.img, fit:BoxFit.cover,)
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0, 
                  right: 0,
                  child: SizedBox(
                    width: double.infinity,
                    height: 25,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),

          // Detail
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.nama,
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          item.harga,
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const Gap(10),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Row(
                      children: [
                        const Icon(Icons.star, size: 15, color: Colors.amber,),
                        const Gap(2),
                        Text(item.rating),
                      ],
                    ),
                  ),
                  const Gap(10),
                  SizedBox(
                    width: double.infinity,
                    height: 5,
                    child: Container(
                      color: Colors.grey.shade200),
                  ),
                  const Gap(20),
              
                  // Deskripsi
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Text('Details', style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  const Gap(10),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Text(item.deskripsi),
                  ),
              
                  // Button Order
                  Expanded(
                    child: Align(
                      alignment: AlignmentGeometry.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              foodController.launchWhatsApp(item.nama);
                            }, 
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)
                              )
                            ),
                            child: const Text('ORDER', style: TextStyle(color: Colors.white),),
                          ),
                        ),
                      ),
                    ),
                  ), 
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}