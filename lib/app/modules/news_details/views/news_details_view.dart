import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/news_details_controller.dart';

class NewsDetailsView extends GetView<NewsDetailsController> {
  const NewsDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('news_details'.tr), centerTitle: true),
      body: Center(
        child: Text(
          'news_details_message'.tr,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
