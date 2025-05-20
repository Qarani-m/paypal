import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:paypal/src/constants/images.dart';

class AddBank extends StatelessWidget {
  const AddBank({super.key});

  @override
  Widget build(BuildContext context) {
    // Show bottom sheet after build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.bottomSheet(Container(
        height: 170.h,
        padding:
            EdgeInsets.only(left: 15.w, right: 15.w, bottom: 4.h, top: 6.h),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.r),
              topRight: Radius.circular(15.r),
            )),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () =>  Get.close(2),
                child: Icon(
                  Icons.close,
                  color: Colors.black54,
                  size: 12.sp,
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            SvgPicture.asset(
              AppImages.bank,
              height: 16.h,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Link your bank account on our website',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: 7.h,
            ),
            Text(
              'We\'re adding features as fast as we can. For now, please link your bank account on our website',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 7.sp,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 5.h,
              ),
              width: double.maxFinite,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20.r)),
              child: Text(
                'Go to our Website',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w900),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 5.h,
              ),
              width: double.maxFinite,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20.r)),
              child: Text(
                'Not now',
                style: TextStyle(
                    color: const Color.fromARGB(255, 19, 123, 209),
                    fontSize: 7.sp,
                    fontWeight: FontWeight.w700),
              ),
            )
          ],
        ),
      ));
    });

    return Scaffold(
      backgroundColor: Colors.white,
    );
  }
}
