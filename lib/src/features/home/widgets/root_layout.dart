// lib/src/features/root_layout.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paypal/src/features/home/controllers/navigation_controller.dart';
import 'package:paypal/src/features/home/models/nav_item.dart';
import 'package:paypal/src/features/home/screens/homepage.dart';
import 'package:paypal/src/features/home/widgets/bottom_appbar.dart';
import 'package:paypal/src/features/payments/screens/payments_homepgae.dart';
import 'package:paypal/src/features/wallet/screens/wallet_homepage.dart';

class RootLayout extends GetView<NavigationController> {
  RootLayout({Key? key}) : super(key: key);

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
      page:   PaymentsHomepgae(),
    ),
    NavItem(
      label: 'Send/Request',
      svgPath: 'assets/svg/arrow-down-up.svg',
      page:   PaymentsHomepgae(),
    ),
  
    NavItem(
      label: 'Wallet',
      svgPath: 'assets/svg/wallet.svg',
      page: const WalletHomepage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _navItems[controller.selectedIndex].page??Homepage()),
      bottomNavigationBar: CustomBottomNavigationBar(
        items: _navItems,
        selectedColor: Colors.black,
        unselectedColor: Colors.grey,
        backgroundColor: Colors.white,
        height: 35.h,
      ),
    );
  }
}



