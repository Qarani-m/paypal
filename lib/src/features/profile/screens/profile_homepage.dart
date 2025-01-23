import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:paypal/src/constants/images.dart';

class ProfileHomepage extends StatelessWidget {
  const ProfileHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFeff2f9),
        centerTitle: true,
        title: Text(
          "Menu",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 9.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black.withOpacity(1)),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 13.w, right: 20.w, top: 20.h),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Manage finances',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w700,
                      )),
            ),
            SizedBox(
              height: 7.h,
            ),
            WhiteSpace(
              icon: '',
              text1: 'Payment preferences',
              text2: 'Add banks and cards',
            ),
            SizedBox(
              height: 7.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Send and pay',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w700,
                      )),
            ),
            SizedBox(
              height: 7.h,
            ),
            WhiteSpace(
              icon: '',
              text1: 'Send to a PayPal account',
              text2: 'Pay bills',
            ),
            SizedBox(
              height: 7.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Get paid',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w700,
                      )),
            ),
            SizedBox(
              height: 7.h,
            ),
            WhiteSpace(
              icon: '',
              text1: 'Request money',
              text2: '',
              showTwo: false,
            ),
            SizedBox(
              height: 7.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Profile and support',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w700,
                      )),
            ),
            SizedBox(
              height: 7.h,
            ),
            WhiteSpace(
              icon: '',
              text1: 'Your profile',
              text2: 'Your wallet',
            ),
            SizedBox(
              height: 7.h,
            ),
          ],
        ),
      ),
    );
  }
}

class WhiteSpace extends StatelessWidget {
  const WhiteSpace({
    this.showTwo = true,
    super.key,
    required this.icon,
    required this.text1,
    this.text2 = '',
  });

  final String icon;
  final String text1;
  final String text2;
  final bool showTwo;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      padding: EdgeInsets.only(left: 10.w, top: 8.h, bottom: 8.h),
      child: Column(
        children: [
          GestureDetector(
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
                  text1,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontSize: 7.sp, color: Colors.black),
                )
              ],
            ),
          ),
          showTwo
              ? Column(
                  children: [
                    SizedBox(
                      height: 13.h,
                    ),
                    GestureDetector(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppImages.onlinePurchases,
                            height: 15.h,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            text2,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(fontSize: 7.sp, color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              : Center()
        ],
      ),
    );
  }
}
