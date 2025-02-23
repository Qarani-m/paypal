import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paypal/src/features/auth/models/user_model.dart';

class SettingsController extends GetxController {
  final _storage = GetStorage(); // GetStorage instance
  final Rx<UserModel> user = UserModel().obs; // Reactive UserModel instance

RxBool showContent = false.obs;


  @override
  Future<void> onInit() async {
    super.onInit();

    await loadUserData();
  }

  Future<void> loadUserData() async{
    final data = _storage.read<Map<String, dynamic>>('user_data');
    if (data != null) {
      user.value = UserModel.fromJson(data);
    }
  }

  void updateUser(UserModel updatedUser) {
    user.value = updatedUser;
    _storage.write('user_data', updatedUser.toJson());
  }
}


