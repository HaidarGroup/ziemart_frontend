import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ziemart_frontend/controllers/food_controller.dart';
import 'package:ziemart_frontend/models/food_model.dart';
import 'package:ziemart_frontend/view/widgets/card_food.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final FoodController foodController = Get.put(FoodController());
  
  get crossAxisCount => null;
  get itemBuilder => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 255, 202,),
      body: Container(
        margin: const EdgeInsets.all(20),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Judul
            const Text(
              'Experience the\ngreat food',
              style: TextStyle(
                fontSize: 32, 
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
            ),
            const Gap(10),
            const Text(
              'Our daily healthy food'
            ),
        
            // Grid View
            const Gap(10),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.9,), 
                itemCount: itemFood.length,
                itemBuilder: (context, index) {
                  return ZoomTapAnimation(
                    onTap: () {
                      foodController.openDetailsPage(itemFood[index]);
                    },
                    child: CardFood(
                      img: itemFood[index].img,
                      nama: itemFood[index].nama,
                      toko: itemFood[index].toko,
                      harga: itemFood[index].harga,
                      rating: itemFood[index].rating,
                    )
                  );
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}