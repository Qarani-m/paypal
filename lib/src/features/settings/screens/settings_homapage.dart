import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:paypal/src/constants/images.dart';
import 'package:paypal/src/features/profile/screens/profile_homepage.dart';
import 'package:paypal/src/features/settings/controllers/settings_controller.dart';
import 'package:paypal/src/features/settings/screens/message_center.dart';
import 'package:paypal/src/features/settings/screens/persona_infor.dart';

import 'package:shimmer/shimmer.dart';

class SettingsHomapage extends GetView<SettingsController> {
  const SettingsHomapage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> accountMenuItems = [
      {
        'text': 'Account information',
        'onTap': () {
          controller.showContent.value = false;
          Get.to(PersonaInfor());
        }
      },
      {'text': 'Login and security'},
      {'text': 'Data and Privacy'},
      {'text': 'Notification preferences'},
      {'text': 'Marketing preferences'},
    ];

    final List<Map<String, dynamic>> supportMenuItems = [
      {'text': 'Tax documents'},
      {'text': 'Message Center', 'onTap': () => Get.to(MessageCenter())},
      {'text': 'Help'},
    ];

    final List<Map<String, dynamic>> topMenu = [
      {'text': 'Invite friends'},
      {'text': 'Look and sell like a pro with SellerProfile'},
    ];

    final Map<String, List<Widget>> iconsMap = {
      "one": [SvgPicture.asset('assets/svg/settings/person.svg')],
      'two': [
        SvgPicture.asset('assets/svg/settings/person.svg'),
        SvgPicture.asset('assets/svg/settings/help.svg')
      ],
      'three': [
        SvgPicture.asset('assets/svg/settings/bin.svg'),
      ],
      'four': [SvgPicture.asset('assets/svg/settings/logout.svg')],
    };

    List<String> settings = ['settings', 'settings2'];
    controller.showContent.value = false;

    // controller.loadUserData();
    Future.delayed(Duration(seconds: 1), () {
      print('-------');
      controller.showContent.value = true;
    });

    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(kToolbarHeight), // Standard AppBar height
        child: Obx(
          () => AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, size: 15.h),
              onPressed: () => Navigator.pop(context),
            ),
            elevation: 0,
            actions: [
              if (controller.showContent.value)
                Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: Icon(
                    Icons.notifications_outlined,
                    size: 15.h,
                  ),
                ),
            ],
            backgroundColor: Color(0xFFeff2f9),
            centerTitle: true,
            title: Text(
              controller.showContent.value ? "Settings" : '',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(1),
                  ),
            ),
          ),
        ),
      ),
      body: Obx(
        () => Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
          child: SingleChildScrollView(
            child: controller.showContent.value
                ? MainPage(
                    settings: settings,
                    controller: controller,
                    topMenu: topMenu,
                    accountMenuItems: accountMenuItems,
                    supportMenuItems: supportMenuItems,
                  )
                : Shimmer.fromColors(
                    baseColor: Colors.grey[300]!.withOpacity(0.4),
                    highlightColor: Colors.grey[100]!.withOpacity(0.1),
                    child: ShimmerEffect(),
                  ),
          ),
        ),
      ),
    );
  }
}

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: 50.h,
            width: 50.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),

        Container(
          height: 90.h,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        SizedBox(height: 15.h),

        // Column of Boxes
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Large Box (200.h height)

            // Six smaller boxes (80.h height each)
            for (int i = 0; i < 6; i++)
              Padding(
                padding: EdgeInsets.only(bottom: 5.h),
                child: Container(
                  height: 40.h,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
          ],
        )
      ],
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
    required this.settings,
    required this.controller,
    required this.topMenu,
    required this.accountMenuItems,
    required this.supportMenuItems,
  });

  final List<String> settings;
  final SettingsController controller;
  final List<Map<String, dynamic>> topMenu;
  final List<Map<String, dynamic>> accountMenuItems;
  final List<Map<String, dynamic>> supportMenuItems;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            // Curved purple background
            Container(
              height: 140.h,
              padding: EdgeInsets.only(bottom: 85.h),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r),
                    bottomLeft: Radius.circular(10.r),
                    bottomRight: Radius.circular(10.r),
                  )),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            'assets/images/${settings[Random().nextInt(settings.length)]}.png')),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.r),
                      topRight: Radius.circular(10.r),
                    )),
              ),
            ),

            // Profile content
            Positioned(
              left: 0,
              right: 0,
              top: 27.h, // Adjust this to position the content
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Profile image
                    Center(
                      child: Stack(
                        children: [
                          controller.user.value.hasImage
                              ? Container(
                                  height: 32.h,
                                  width: 32.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey[300],
                                  ),
                                  child: ClipOval(
                                    child: Image.file(
                                      File(controller.user.value.imagePath),
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Icon(Icons.person,
                                            color: Colors.grey[600]);
                                      },
                                    ),
                                  ),
                                )
                              : Container(
                                  height: 35.h,
                                  width: 35.h,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/accountinfor/0.png'),
                                      ),
                                      shape: BoxShape.circle),
                                ),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: CircleAvatar(
                                radius: 9.r,
                                backgroundColor: Colors.grey.shade100,
                                child: Icon(
                                  Icons.qr_code,
                                  size: 10.h,
                                  color: Colors.black,
                                ),
                              ))
                        ],
                      ),
                    ),

                    SizedBox(height: 8.h),
                    // Name
                    Text(
                      controller.user.value.name,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    // Email
                    Text(
                      controller.user.value.email,
                      style: TextStyle(
                          fontSize: 9.sp,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blue),
                    ),
                    SizedBox(height: 10.h),

                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 3.h, horizontal: 18.w),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(20.r)),
                        child: Text(
                          'Edit',
                          style: TextStyle(
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black.withOpacity(0.8)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: Colors.white,
          ),
          child: Column(
            children: List.generate(
              topMenu.length,
              (index) => Column(
                children: [
                  GestureDetector(
                    onTap: topMenu[index]['onTap'],
                    child: TheActualContent(
                        text: topMenu[index]['text'],
                        icon: Container(
                          height: 25.h,
                          width: 25.h,
                          decoration: BoxDecoration(
                              // color: Colors.red,

                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/inviteFriends/${index}.png'))),
                        )),
                  ),
                  if (index != topMenu.length - 1) SizedBox(height: 15.h),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Container(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Colors.white,
            ),
            child: Column(
              children: List.generate(
                accountMenuItems.length,
                (index) {
                  final item =
                      accountMenuItems[index]; // Access item with index
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: item['onTap'],
                        child: TheActualContent(
                          text: item['text'],
                          icon: Container(
                            height: 18.h,
                            width: 18.h,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/accountinfor/$index.png'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (index != accountMenuItems.length - 1)
                        SizedBox(height: 15.h),
                    ],
                  );
                },
              ),
            )),
        SizedBox(
          height: 10.h,
        ),
        Container(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Colors.white,
            ),
            child: Column(
              children: List.generate(
                supportMenuItems.length,
                (index) {
                  final item = supportMenuItems[index];
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: item['onTap'],
                        child: TheActualContent(
                            text: item['text'],
                            icon: Container(
                              height: 18.h,
                              width: 18.h,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/taxdocuments/$index.png'),
                                ),
                              ),
                            )),
                      ),
                      if (index != supportMenuItems.length - 1)
                        SizedBox(height: 15.h),
                    ],
                  );
                },
              ),
            )),
        SizedBox(
          height: 10.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r), color: Colors.white),
          child: TheActualContent(
              text: 'Close your account',
              icon: Container(
                height: 18.h,
                width: 18.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/closeaccount/0.png'),
                  ),
                ),
              )),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r), color: Colors.white),
          child: TheActualContent(
            icon: SvgPicture.asset('assets/svg/settings/logout.svg'),
            text: "Log out",
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            "Legal",
            style: Theme.of(context)
                .textTheme
                .displayLarge
                ?.copyWith(fontWeight: FontWeight.w400, fontSize: 8.sp),
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            "Version 8.76.0",
            style: Theme.of(context)
                .textTheme
                .displayLarge
                ?.copyWith(fontWeight: FontWeight.w400, fontSize: 8.sp),
          ),
        ),
        SizedBox(
          height: 25.h,
        ),
      ],
    );
  }
}

class TheActualContent extends StatelessWidget {
  const TheActualContent({
    super.key,
    required this.text,
    this.icon = const Icon(Icons.abc),
  });
  final String text;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          SizedBox(
            width: 10.w,
          ),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(fontSize: 8.sp, color: Colors.black),
          )
        ],
      ),
    );
  }
}

class CurvedBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.purple // Adjust color as needed
      ..style = PaintingStyle.fill;

    final path = Path();
    path.lineTo(0, size.height * 0.8); // Start at top-left

    // Create curve
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height * 0.8,
    );

    path.lineTo(size.width, 0); // Line to top-right
    path.close(); // Complete the path

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ShimmerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Background color
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Stack(
            children: [
              // Circle positioned at center left
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 100.h,
                  width: 100.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),

              // Column of Boxes
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Large Box (200.h height)
                  Container(
                    height: 200.h,
                    width: double.maxFinite,
                    margin: EdgeInsets.only(left: 50.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  SizedBox(height: 10.h),

                  // Six smaller boxes (80.h height each)
                  for (int i = 0; i < 6; i++)
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: Container(
                        height: 80.h,
                        width: double.maxFinite,
                        margin: EdgeInsets.only(left: 50.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
