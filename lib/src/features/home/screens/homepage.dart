import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:paypal/src/features/home/controllers/homepage_controller.dart';
import 'package:paypal/src/features/home/models/nav_item.dart';
import 'package:paypal/src/features/home/widgets/bottom_appbar.dart';
import 'package:paypal/src/features/home/widgets/homepage_buttons.dart';

class Homepage extends GetView<HomepageController> {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<NavItem> _navItems = [
      NavItem(
        label: 'Home',
        svgPath: 'assets/svg/house.svg',
        page: const Center(child: Text('Home Page')),
      ),
      NavItem(
        label: 'Payments',
        svgPath: 'assets/svg/currency-dollar.svg',
        page: const Center(child: Text('Payments Page')),
      ),
      NavItem(
        label: 'Wallet',
        svgPath: 'assets/svg/wallet.svg',
        page: const Center(child: Text('Wallet Page')),
      ),
    ];

    return Scaffold(
      backgroundColor: Color(0xFFebedf3),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 30.h),
            color: Colors.red,
            height: 100,
            width: double.maxFinite,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Get.toNamed('/settings'),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 18.r,
                        child: Icon(
                          Icons.menu,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: ()=>Get.toNamed("/profile"),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 18.r,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  color: Colors.white,
                  child: ListTile(
                    leading: Container(
                      height: 20.h,
                      width: 20.h,
                      color: Colors.red,
                    ),
                    title: Text(
                      "\$0.00",
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge
                          ?.copyWith(fontWeight: FontWeight.w800),
                    ),
                    subtitle: Text("PayPal balance",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w400)),
                  ),
                )
              ],
            ),
          )),
          HomepageButtonContainer(
            textLeft: "Send",
            textRight: "Request",
          )
        ],
      ),
    );
  }
}
