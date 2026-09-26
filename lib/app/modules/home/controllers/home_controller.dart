import 'package:get/get.dart';
import 'package:news_app/app/modules/news.model.dart';

import '../../../data/providers/api_provider.dart';

class HomeController extends GetxController {
    final _apiProvider = Get.find<ApiProvider>();

    Rx<NewsModel> news = Rx(NewsModel());
    var isLoading = false.obs;

    @override
  void onInit() {
    getNews();
    super.onInit();
  }

  void getNews() async {
    try {
      isLoading.value = true;
      final res = await _apiProvider.fetchNews();
      if (res.statusCode != 200) {
        throw res.statusMessage ?? "Something went wrong";
      }

      final data = res.data;
      news.value = NewsModel.fromJson(data);

    } catch (e) {
      // print("Error: $e");
      Get.snackbar("Error", e.toString());
    }

    finally {
      isLoading.value = false;
    }
  }
}
