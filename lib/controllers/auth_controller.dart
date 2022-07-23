import 'package:get/get.dart';
import 'package:grocery_app_front/data/repository/auth_repo.dart';
import 'package:grocery_app_front/models/response_model.dart';
import 'package:grocery_app_front/models/signup_body_model.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  AuthController({required this.authRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ResponseModel> registration(SignupBody signupBody) async {
    _isLoading = true;
    update();
    Response response = await authRepo.signup(signupBody);
    late ResponseModel responseModel;
    if (response.statusCode == 201) {
      authRepo.saveUserToken(response.body["token"]);
      responseModel = ResponseModel(true, response.body["token"]);
    } else {
      responseModel = ResponseModel(true, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> login(String phone, String password) async {
    _isLoading = true;
    update();
    Response response = await authRepo.login(phone, password);
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      authRepo.saveUserToken(response.body["token"]);
      print('token ' + response.body["token"]);
      saveUserNumberAndPassword(phone, password);
      responseModel = ResponseModel(true, response.body["token"]);
    } else {
      responseModel = ResponseModel(true, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  void saveUserNumberAndPassword(String phone, String password) async {
    authRepo.saveUserNumberAndPassword(phone, password);
  }

  bool userHasLoggedIn() {
    return authRepo.userHasLoggedIn();
  }

  bool clearSharedData() {
    return authRepo.clearSharedData();
  }
}
