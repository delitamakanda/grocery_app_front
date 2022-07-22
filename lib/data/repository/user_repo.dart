import 'package:get/get.dart';
import 'package:grocery_app_front/data/api/api_client.dart';
import 'package:grocery_app_front/utils/app_constants.dart';

class UserRepo {
  final ApiClient apiClient;
  UserRepo({required this.apiClient});

  Future<Response> getUserInfo() async {
    return await apiClient.getData(AppConstants.CURRENT_USER_URI);
  }
}
