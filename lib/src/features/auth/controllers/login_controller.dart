import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:paypal/main.dart';
import 'package:paypal/src/features/auth/models/user_model.dart';
import 'package:paypal/src/features/auth/screens/loading_page.dart';
import 'package:paypal/src/features/auth/screens/openning_sequence/scene_one.dart';

class LoginController extends GetxController {
  UserModel userDetails = new UserModel();
  @override
  void onInit() {
    super.onInit();
    UserModel? fetchedUser = fetchUser();
    userDetails =
        fetchedUser ?? UserModel(); // Use fetched user or create empty model
    // authenticateWithFingerprint();
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

      // Check for available biometrics
      final bool canAuthWithBiometrics = await auth.canCheckBiometrics;
      final List<BiometricType> availableBiometrics =
          await auth.getAvailableBiometrics();

      if (canAuthWithBiometrics && availableBiometrics.isNotEmpty) {
        final bool didAuthenticate = await auth.authenticate(
          localizedReason: ' ',
          options: const AuthenticationOptions(
              stickyAuth: true, biometricOnly: true),
          authMessages: const <AuthMessages>[
            AndroidAuthMessages(
              signInTitle: 'Verify your identity',
              cancelButton: 'Cancel',
              biometricHint: 'PayPal needs to verify it’s you',
              biometricNotRecognized: 'Fingerprint not recognized',
              biometricRequiredTitle: 'Fingerprint Required',
              biometricSuccess: 'Authentication successful',
            ),
          ],
        );

        if (didAuthenticate) {
          final storage = GetStorage();
          var savedUser = storage.read('ccc');
          if (savedUser != null) {
            Get.off(LoadingPage());
          } else {
            Get.to(SceneOne(
              goNext: 'yes',
            ));
          }
        }
      } else {
        // Fallback for devices without biometrics
        // Get.offNamed('/home');
      }
    } catch (e) {
      if (e is PlatformException && e.code == "NotAvailable") {
        // Handle specific error and navigate
        Get.off(MyWidget());
      } else {
        // Show other errors
        print('==== $e');
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }
}
