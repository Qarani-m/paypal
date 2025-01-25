import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:paypal/src/constants/images.dart';
import 'package:paypal/src/features/profile/screens/profile_homepage.dart';
import 'package:paypal/src/features/settings/controllers/settings_controller.dart';
import 'package:paypal/src/features/settings/screens/message_center.dart';
import 'package:paypal/src/features/settings/screens/persona_infor.dart';

class SettingsHomapage extends GetView<SettingsController> {
  const SettingsHomapage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 12.sp), // Adjust size here
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: Icon(Icons.notifications_outlined),
          )
        ],
        backgroundColor: Color(0xFFeff2f9),
        centerTitle: true,
        title: Text(
          "Settings",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 8.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black.withOpacity(1)),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                // Curved purple background
                Container(
                  height: 120.h,
                  padding: EdgeInsets.only(bottom: 70.h),
                  width: double.infinity,
                  child: Container(
                    height: 100.h,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              
                              
                              'assets/images/settings.png')),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.r),
                          topRight: Radius.circular(10.r),
                        )),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.r),
                        topRight: Radius.circular(10.r),
                        bottomLeft: Radius.circular(10.r),
                        bottomRight: Radius.circular(10.r),
                      )),
                ),

                // Profile content
                Positioned(
                  left: 0,
                  right: 0,
                  top: 27.h, // Adjust this to position the content
                  child: Column(
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
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(Icons.person,
                                        color: Colors.grey[600]);
                                  },
                                ),
                              ),
                            )
                          :  Container(
                    height: 35.h,
                    width: 35.h,
                    decoration: BoxDecoration(
                    color: Colors.grey,

                      shape: BoxShape.circle
                    ),
                  ),









                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 7.r,
                      child:    SvgPicture.asset(
                    'assets/svg/house.svg',
                    height: 5.h,
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
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
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
                  color: Colors.white),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: ()=>Get.to(PersonaInfor()),
                    child: TheActualContent(
                      text: 'Personal info',
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TheActualContent(
                    text: 'Login and security',
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TheActualContent(
                    text: 'Data and Privacy',
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TheActualContent(
                    text: 'Notification preferences',
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TheActualContent(
                    text: 'Marketing preferences',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: Colors.white),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: ()=>Get.to(MessageCenter()),
                    child: TheActualContent(
                      text: 'Message Center',
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TheActualContent(
                    text: 'Help',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: Colors.white),
              child: TheActualContent(
                text: 'Close your account',
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: Colors.white),
              child: TheActualContent(
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
          ],
        ),
      ),
    );
  }
}

class TheActualContent extends StatelessWidget {
  const TheActualContent({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppImages.onlinePurchases,
            height: 14.h,
          ),
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
