import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';

class LoginController extends GetxController {
 @override
 void onInit() {
   super.onInit();
   authenticateWithFingerprint();
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
         stickyAuth: true,
         biometricOnly: true
       ),
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
       Get.offNamed('/home');
     }
   }
 } catch (e) {
   print(e);
 }
}
}