import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

import '../../config/app_config.dart';

class ApiProvider extends GetxService {
  late Dio _dio;

  @override
  void onInit() {
    _initializeDio(); // this method initializes the Dio instance with the base URL and default headers
    // initialize dio
    super.onInit();
  }

  void _initializeDio() {
    _dio = Dio(
      BaseOptions(
        baseUrl: kBaseUrl,
        followRedirects: false,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        validateStatus: (status) {
          return status != null && status >= 200 && status < 300;
        },
      ),
    );
  }

  Future<Response> fetchNews() async {

    try {
      final res = await _dio.get(
        // '/api/v4/search?q=example&lang=en&country=us&max=10&apikey=$kApiKey',
        '/api/v4/search',
        queryParameters: {
          'q': 'example',
          'lang': 'en',
          'country': 'us',
          'max': 20,
          'apikey': kApiKey,
        },
      );

      return res;
    } catch (e) {
      rethrow;
    }
  }
}