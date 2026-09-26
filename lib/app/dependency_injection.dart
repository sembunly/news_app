

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'data/providers/api_provider.dart';

class DependencyInjection {
  static void init() {
    // Initialize your dependencies here

    Get.put (ApiProvider());
  }
}