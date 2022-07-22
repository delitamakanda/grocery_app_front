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

  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }

  Future<String> getUserToken() async {
    return await sharedPreferences.getString(AppConstants.TOKEN) ?? "None";
  }

  bool userHasLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.TOKEN);
  }

  Future<Response> login(String phone, String password) async {
    return await apiClient.postData(
        AppConstants.SIGNIN_URI, {"phone_number": phone, "password": password});
  }

  Future<void> saveUserNumberAndPassword(String phone, String password) async {
    try {
      await sharedPreferences.setString(AppConstants.PHONE_NUMBER, phone);
      await sharedPreferences.setString(AppConstants.PASSWORD, password);
    } catch (e) {
      rethrow;
    }
  }

  bool clearSharedData() {
    sharedPreferences.remove(AppConstants.TOKEN);
    sharedPreferences.remove(AppConstants.PHONE_NUMBER);
    sharedPreferences.remove(AppConstants.PASSWORD);
    apiClient.token = '';
    apiClient.updateHeader('');
    return true;
  }
}
