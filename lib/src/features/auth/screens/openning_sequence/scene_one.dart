import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paypal/src/features/auth/screens/login_page.dart';
import 'package:paypal/src/features/auth/screens/openning_sequence/sequence_controller.dart';
import 'package:paypal/src/features/home/models/nav_item.dart';
import 'package:paypal/src/features/home/screens/homepage.dart';
import 'package:paypal/src/features/home/widgets/bottom_appbar.dart';
import 'package:paypal/src/features/home/widgets/homepage_widgets.dart';
import 'package:paypal/src/features/payments/screens/payments_homepgae.dart';
import 'package:paypal/src/features/wallet/screens/wallet_homepage.dart';

class SceneOne extends GetView<SequenceController> {
  const SceneOne({this.goNext = 'no', super.key});

  final String goNext;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {



if(goNext=='yes'){
      Get.offNamed('/home');

}else{

      Get.off(() => const LoginPage());

}

    });
    final List<NavItem> _navItems = [
      NavItem(
        label: 'Home',
        svgPath: 'assets/svg/house.svg',
        page: const Homepage(),
        // page: const Homepage1(),
      ),
      NavItem(
        label: 'Crypto',
        svgPath: 'assets/svg/bar-chart-line.svg',
        page: PaymentsHomepgae(),
      ),
      NavItem(
        label: 'Send/Request',
        svgPath: 'assets/svg/arrow-down-up.svg',
        page: PaymentsHomepgae(),
      ),
      NavItem(
        label: 'Wallet',
        svgPath: 'assets/svg/wallet.svg',
        page: const WalletHomepage(),
      ),
    ];

    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        items: _navItems,
        selectedColor: Colors.black,
        unselectedColor: Colors.grey,
        backgroundColor: Colors.white,
        height: 35.h,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 10.w, right: 0.w, top: 30.h),
        child: Column(
          children: [
            SettingAndProfileMenu(), // This stays at top
            Expanded(
              child: Center(
                  child: SizedBox(
                width: 36.h, // Adjust to your desired size
                height: 36.h, // Adjust to your desired size
                child: CircularProgressIndicator(
                  strokeWidth: 2, // Adjust thickness
                  color: Color(0xFF334187),
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
