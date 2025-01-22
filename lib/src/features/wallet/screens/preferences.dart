import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paypal/src/constants/colors.dart';
import 'package:paypal/src/constants/images.dart';
import 'package:paypal/src/features/wallet/controllers/wallet_controller.dart';

class Preferences extends GetView<WalletController> {
  const Preferences({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the arguments
    final argument = Get.arguments as String;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          argument,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 11.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black.withOpacity(1)),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.only(top: 00.h, left: 10.w, right: 10.w),
          child: argument == 'Automatic payments'
              ? Column(
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 38.h,
                          width: 38.h,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                    AppImages.atmCard,
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text('Github, Inc ',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    )),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Some logos provided by ',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w400,
                                    )),
                        Text('Clearbit',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.green)),
                      ],
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    Text('Preferred when paying online',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w800,
                            )),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                        'We\'ll use this when you shop online or send money for goods and services',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w400,
                            )),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text('More about payment preferences',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              decoration: TextDecoration.underline,
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF0166f6),
                              decorationColor: Color(0xFF0166f6),
                            )),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 15.h,
                          width: 45.w,
                          decoration: BoxDecoration(
                              // color: Colors.red,
                              image: DecorationImage(
                                  image: AssetImage(AppImages.paypalLogo1))),
                        ),
                        Text('PayPal balance',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w400,
                                    )),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 15.h,
                          width: 35.w,
                          decoration: BoxDecoration(
                              // color: Colors.red,
                              image: DecorationImage(
                                  image: AssetImage(AppImages.atmCard))),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        SizedBox(
                          height: 80.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Your bank',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        fontSize: 9.sp,
                                        fontWeight: FontWeight.w400,
                                      )),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Prepaid ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            fontSize: 9.sp,
                                            fontWeight: FontWeight.w400,
                                          )),
                                  Text('⋅⋅',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            fontSize: 23.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          )),
                                  Text('6335',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            fontSize: 9.sp,
                                            fontWeight: FontWeight.w400,
                                          )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                )),
    );
  }
}
