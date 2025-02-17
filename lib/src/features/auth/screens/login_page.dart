import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:paypal/src/features/auth/controllers/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
        bool hasCheckedAuth = false;
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!hasCheckedAuth) {
        hasCheckedAuth = true;
        controller.authenticateWithFingerprint();
      }
    });

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h),
        child: Column(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Column(
                children: List.generate(
                    3,
                    (index) => Padding(
                          padding: EdgeInsets.only(bottom: 2.h),
                          child: Container(
                            height: 4.5.h,
                            width: 4.5.h,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1.4),
                                shape: BoxShape.circle),
                          ),
                        )),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  'assets/svg/person.svg',
                  height: 15.h,
                  color: Color(0xFF00186a),
                )
                // CircleAvatar(backgroundColor: Color(0xFF00186a), radius: 7.r),
                ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "${controller.userDetails.name}",
              style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
            ),
            Text(
              "${controller.userDetails.email}",
              style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
