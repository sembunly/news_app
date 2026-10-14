import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:news_app/app/modules/news.model.dart';

import '../../../data/providers/api_provider.dart';

class HomeController extends GetxController {
  final _apiProvider = Get.find<ApiProvider>();
  final _connectivity = Connectivity();

  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;
  bool _isOffline = false;

  Rx<NewsModel> news = Rx(NewsModel());
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _initializeConnectivity();
  }

  Future<void> _initializeConnectivity() async {
    final results = await _connectivity.checkConnectivity();
    _isOffline = _hasNoConnection(results);

    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      _handleConnectivityChange,
    );

    if (_isOffline) {
      _showNoInternetMessage();
      return;
    }

    await getNews();
  }

  Future<void> _handleConnectivityChange(
    List<ConnectivityResult> results,
  ) async {
    final isOffline = _hasNoConnection(results);

    if (isOffline == _isOffline) return;

    _isOffline = isOffline;
    if (_isOffline) {
      _showNoInternetMessage();
      return;
    }

    if ((news.value.articles ?? []).isEmpty) {
      await getNews();
    }
  }

  bool _hasNoConnection(List<ConnectivityResult> results) {
    return results.isEmpty || results.contains(ConnectivityResult.none);
  }

  void _showNoInternetMessage() {
    Get.snackbar('No Internet', 'Please check your internet connection');
  }

  Future<void> getNews() async {
    try {
      final results = await _connectivity.checkConnectivity();
      _isOffline = _hasNoConnection(results);

      if (_isOffline) {
        _showNoInternetMessage();
        return;
      }

      isLoading.value = true;
      final res = await _apiProvider.fetchNews();
      if (res.statusCode != 200) {
        throw res.statusMessage ?? "Something went wrong";
      }

      final data = res.data;
      news.value = NewsModel.fromJson(data);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    _connectivitySubscription?.cancel();
    super.onClose();
  }
}
