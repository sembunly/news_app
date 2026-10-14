import 'package:get/get.dart';
import 'package:news_app/app/modules/news.model.dart';

class NewsDetailsController extends GetxController {
  final Rxn<Articles> article = Rxn<Articles>();

  void getNewsDetails() {
    article.value = Get.arguments as Articles?;
  }

  @override
  void onInit() {
    super.onInit();
    getNewsDetails();
  }
}