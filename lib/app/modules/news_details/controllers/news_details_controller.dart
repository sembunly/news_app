import 'package:get/get.dart';
import 'package:news_app/app/modules/news.model.dart';

class NewsDetailsController extends GetxController {
  final Rxn<Articles> article = Rxn<Articles>();

  void getNewsDetails() {
    final arguments = Get.arguments;
    if (arguments is Articles) {
      article.value = arguments;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getNewsDetails();
  }
}
