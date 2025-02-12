import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paypal/src/features/auth/controllers/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
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
                            height: 3.5.h,
                            width: 3.5.h,
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
              child:
                  CircleAvatar(backgroundColor: Color(0xFF00186a), radius: 7.r),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "${controller.userDetails.name}",
              style: TextStyle(
                  fontSize: 8.5.sp,
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
            ),
            Text(
              "${controller.userDetails.email}",
              style: TextStyle(
                  fontSize: 8.5.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
