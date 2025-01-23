import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:paypal/src/constants/images.dart';
import 'package:paypal/src/features/home/controllers/homepage_controller.dart';
import 'package:paypal/src/features/home/models/nav_item.dart';
import 'package:paypal/src/features/home/widgets/bottom_appbar.dart';
import 'package:paypal/src/features/home/widgets/homepage_buttons.dart';

class Homepage extends GetView<HomepageController> {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFebedf3),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.only(left: 13.w, right: 13.w, top: 30.h),
            color: Color(0xFFeff2f9),
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
                        radius: 11.r,
                        child: Icon(
                          Icons.menu,
                          size: 10.h,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed("/profile"),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 11.r,
                        child: Icon(
                          Icons.person_2_outlined,
                          size: 10.h,
                          color: Colors.blue,
                          weight: 0.1,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6.r)),
                    child: Row(
                      children: [
                        Container(
                          height: 9.h,
                          width: 9.h,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(AppImages.paypalLogo1))),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "\$0.00",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge
                                    ?.copyWith(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 14.sp),
                              ),
                              Text("PayPal balance",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 7.sp)),
                            ],
                          ),
                        ),
                      ],
                    ))
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

class Homepage1 extends GetView<HomepageController> {
  const Homepage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFebedf3),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.only(left: 13.w, right: 13.w, top: 30.h),
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
                        radius: 11.r,
                        child: Icon(
                          Icons.menu,
                          size: 10.h,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed("/profile"),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 11.r,
                        child: Icon(
                          Icons.person_2_outlined,
                          size: 10.h,
                          color: Colors.blue,
                          weight: 0.1,
                        ),
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
