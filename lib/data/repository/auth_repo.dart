import 'package:get/get.dart';
import 'package:grocery_app_front/data/api/api_client.dart';
import 'package:grocery_app_front/models/signup_body_model.dart';
import 'package:grocery_app_front/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> signup(SignupBody signupBody) async {
    return await apiClient.postData(
        AppConstants.SIGNUP_URI, signupBody.toJson());
  }

  saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }

  Future<Response> login(SignupBody signupBody) async {
    return await apiClient.postData(
        AppConstants.SIGNIN_URI, signupBody.toJson());
  }
}
