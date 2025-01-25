import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paypal/src/features/auth/screens/login_page.dart';
import 'package:paypal/src/features/home/screens/homepage.dart';
import 'package:paypal/src/features/home/widgets/root_layout.dart';
import 'package:paypal/src/features/profile/screens/profile_homepage.dart';
import 'package:paypal/src/features/settings/screens/settings_homapage.dart';
import 'package:paypal/src/features/transactions/screens/paypal_loss_recoery.dart';
import 'package:paypal/src/features/transactions/screens/recieved_from_individual.dart';
import 'package:paypal/src/features/transactions/screens/recieved_from_org.dart';
import 'package:paypal/src/features/transactions/screens/refund.dart';
import 'package:paypal/src/features/transactions/screens/send_to_individual.dart';
import 'package:paypal/src/features/transactions/screens/sent_to_bank.dart';
import 'package:paypal/src/features/wallet/screens/card_mainpage.dart';
import 'package:paypal/src/features/wallet/screens/paypal_balance.dart';
import 'package:paypal/src/features/wallet/screens/preferences.dart';
import 'package:paypal/src/features/wallet/screens/wallet_homepage.dart';
import 'package:paypal/src/utils/appbinding.dart';
import 'package:paypal/src/utils/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  // Initialize any required dependencies here
  await initServices();
await GetStorage.init();
  runApp(const MyApp());
}

Future<void> initServices() async {
  // Initialize services here if needed
  await Get.putAsync(() async => await SharedPreferences.getInstance());
  // Add other service initializations as needed
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ScreenUtil initialization with design size
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'PayPal Clone',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.light,
          defaultTransition: Transition.fade,
          smartManagement: SmartManagement.full,
          initialBinding: Appbinding(),
          initialRoute: '/auth',
          getPages: [
            GetPage(
                name: '/auth',
                page: () => LoginPage(),
                transition: Transition.fade),
            GetPage(
                name: '/home',
                page: () => RootLayout(),
                transition: Transition.fade),
            GetPage(
                name: '/paypal_balance',
                page: () => const PaypalBalance(),
                transition: Transition.fade),
            GetPage(
                name: '/card_main_page',
                page: () => const CardMainpage(),
                transition: Transition.fade),
            GetPage(
                name: '/preferences',
                page: () => const Preferences(),
                transition: Transition.fade),
            GetPage(
                name: '/settings',
                page: () => const ProfileHomepage(),
                transition: Transition.fade),
            GetPage(
                name: '/profile',
                page: () => const SettingsHomapage(),
                transition: Transition.fade),

            // =============================================
            GetPage(
                name: '/recieved_from_individual',
                page: () => const RecievedFromIndividual(),
                transition: Transition.fade),
            GetPage(
                name: '/recieved_from_org',
                page: () => const RecievedFromOrg(),
                transition: Transition.fade),

            GetPage(
                name: '/send_to_individual',
                page: () => const SendToIndividual(),
                transition: Transition.fade),
            GetPage(
                name: '/sent_to_bank',
                page: () => const SentToBank(),
                transition: Transition.fade),
            GetPage(
                name: '/send_to_org',
                page: () => const SettingsHomapage(),
                transition: Transition.fade),
            GetPage(
                name: '/refund',
                page: () => const Refund(),
                transition: Transition.fade),//
            GetPage(
                name: '/paypal_recovery',
                page: () => const PaypalLossRecoery(),
                transition: Transition.fade),
          ],

          // Optional: Global error handling
          builder: (context, widget) {
            // Add any global configurations here
            ScreenUtil.init(context);
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!,
            );
          },
        );
      },
    );
  }
}
