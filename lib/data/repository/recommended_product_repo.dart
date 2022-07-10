import 'package:get/get.dart';
import 'package:grocery_app_front/data/api/api_client.dart';
import 'package:grocery_app_front/utils/app_constants.dart';

class RecommendProductRepo extends GetxService {
  final ApiClient apiClient;
  RecommendProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async {
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI);
  }
}
