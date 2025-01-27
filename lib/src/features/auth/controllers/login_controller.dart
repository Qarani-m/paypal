import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:paypal/src/features/auth/models/user_model.dart';
import 'package:paypal/src/features/auth/screens/new_user.dart';

class LoginController extends GetxController {
  UserModel userDetails = new UserModel();
  @override
  void onInit() {
    super.onInit();
    UserModel? fetchedUser = fetchUser();
    userDetails =
        fetchedUser ?? UserModel(); // Use fetched user or create empty model

    authenticateWithFingerprint();
  }

  UserModel? fetchUser() {
    final storage = GetStorage();
    var savedUser = storage.read('user_data');

    if (savedUser != null) {
      return UserModel.fromJson(savedUser);
    }

    return null;
  }

  void authenticateWithFingerprint() async {
    try {
      final LocalAuthentication auth = LocalAuthentication();

      // Get available biometrics
      final List<BiometricType> availableBiometrics =
          await auth.getAvailableBiometrics();

      final bool canAuthWithBiometrics = await auth.canCheckBiometrics;

      if (canAuthWithBiometrics) {
        final bool didAuthenticate = await auth.authenticate(
          localizedReason: ' ',
          options: const AuthenticationOptions(
              stickyAuth: true, biometricOnly: true),
          authMessages: const <AuthMessages>[
            AndroidAuthMessages(
              signInTitle: 'Verify your identity',
              cancelButton: 'Cancel',
              biometricHint: 'PayPal needs to verify its you',
              biometricNotRecognized: 'Fingerprint not recognized',
              biometricRequiredTitle: 'Fingerprint Required',
              biometricSuccess: 'Authentication successful',
            ),
          ],
        );
        if (didAuthenticate) {
          final storage = GetStorage();
          var savedUser = storage.read('user_data');
          if (savedUser != null) {
            Get.offNamed('/home');
          } else {
            Get.off(UserFormPage());
          }
        }
      }
    } catch (e) {
            Get.off(UserFormPage());

      print('====$e');
    }
  }
}
