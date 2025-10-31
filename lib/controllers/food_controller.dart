import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ziemart_frontend/models/food_model.dart';
import 'package:ziemart_frontend/view/pages/detailPage.dart';

class FoodController extends GetxController {

  void openDetailsPage(FoodModel item) {
    Get.to(DetailPage(item: item));
  }

  void launchWhatsApp(String food) async {
    var contact = "+6282288886544";
    var url = "whatsapp://send?phone=$contact&text=Assalamualaikum, saya mau order $food";

    try {
      await launchUrl(Uri.parse(url));
    } on Exception {
      print('WhatsApp is not installed!');
    }
  }
}