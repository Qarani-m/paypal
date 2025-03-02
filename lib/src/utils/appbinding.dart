import 'package:get/get.dart';
import 'package:paypal/src/features/auth/controllers/login_controller.dart';
import 'package:paypal/src/features/auth/screens/new_user.dart';
import 'package:paypal/src/features/auth/screens/openning_sequence/sequence_controller.dart';
import 'package:paypal/src/features/home/controllers/homepage_controller.dart';
import 'package:paypal/src/features/home/controllers/navigation_controller.dart';
import 'package:paypal/src/features/payments/controllers/create_payment.dart';
import 'package:paypal/src/features/payments/controllers/payments_controller.dart';
import 'package:paypal/src/features/settings/controllers/conversation_controller.dart';
import 'package:paypal/src/features/settings/controllers/settings_controller.dart';
import 'package:paypal/src/features/wallet/controllers/wallet_controller.dart';

class Appbinding  extends Bindings{
  @override
  void dependencies() {
    Get.put(UserFormController(), permanent: true);
    Get.put(LoginController(), permanent: true);
    Get.put(NavigationController(), permanent: true);
    Get.put(NavigationController(), permanent: true);
    Get.put(HomepageController(), permanent: true);
    Get.put(WalletController(), permanent: true);
    Get.put(PaymentsController(), permanent: true);
    Get.put(SettingsController(), permanent: true);
    Get.put(ConversationController(), permanent: true);
    Get.put(SequenceController(), permanent: true);


    Get.put(CreatePaymentController(), permanent: true);

    
  }
}