import 'package:get/get.dart';
import 'package:grocery_app_front/data/repository/user_repo.dart';
import 'package:grocery_app_front/models/response_model.dart';
import 'package:grocery_app_front/models/user_model.dart';

class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;
  UserController({required this.userRepo});

  bool _isLoading = false;
  late UserModel _userModel;
  bool get isLoading => _isLoading;
  UserModel get userModel => _userModel;

  Future<ResponseModel> getUserData() async {
    Response response = await userRepo.getUserInfo();
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      _userModel = UserModel.fromJson(response.body);
      _isLoading = true;
      responseModel = ResponseModel(true, "success");
    } else {
      responseModel = ResponseModel(true, response.statusText!);
    }
    // _isLoading = false;
    update();
    return responseModel;
  }
}
