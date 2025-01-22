import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:paypal/src/constants/images.dart';
import 'package:paypal/src/features/profile/screens/profile_homepage.dart';

class SettingsHomapage extends StatelessWidget {
  const SettingsHomapage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              fontSize: 11.sp,
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
                      Container(
                        width: 50.w,
                        height: 50.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                          image: DecorationImage(
                            image: AssetImage(
                                AppImages.atmCard), // Replace with your image
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      // Name
                      Text(
                        'Martin Karani',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      // Email
                      Text(
                        'emqarani@gmail.com',
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
                  TheActualContent(
                    text: 'Personal info',
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
                  TheActualContent(
                    text: 'Message Center',
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
                    ?.copyWith(fontWeight: FontWeight.w600, fontSize: 8.sp),
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
                    ?.copyWith(fontWeight: FontWeight.w600, fontSize: 8.sp),
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
      onTap: () => Get.toNamed('/preferences', arguments: ''),
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
