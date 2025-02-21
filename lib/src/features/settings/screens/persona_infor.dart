import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paypal/src/features/payments/models/payment_model.dart';
import 'package:paypal/src/features/settings/controllers/settings_controller.dart';
import 'package:paypal/src/utils/utilities.dart';
import 'package:shimmer/shimmer.dart';

class PersonaInfor extends GetView<SettingsController> {
  const PersonaInfor({super.key});

  @override
  Widget build(BuildContext context) {
    final _storage = GetStorage(); // GetStorage instance
    final data = _storage.read<Map<String, dynamic>>('user_data');

    // controller.loadUserData();
    Future.delayed(Duration(milliseconds: 400), () {

      controller.showContent.value = true;
    });

    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(kToolbarHeight), // Standard AppBar height
        child: Obx(
          () => AppBar(
            centerTitle: true,
            leading:controller.showContent.value ? IconButton(
              icon: Icon(Icons.arrow_back, size: 15.h),
              onPressed: () => Navigator.pop(context),
            ):SizedBox.shrink(),
            elevation: 0,
            backgroundColor: Color(0xFFeff2f9),
            title: Text(
              controller.showContent.value ? "Account information" : '',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(1),
                  ),
            ),
          ),
        ),
      ),
      body: Obx(()=>Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 3.h),
          child: controller.showContent.value
              ? MainPage(controller: controller, data: data)
              : Shimmer.fromColors(
                  baseColor: Colors.grey[300]!.withOpacity(0.4),
                  highlightColor: Colors.grey[100]!.withOpacity(0.1),
                  child: Column(
                    children: [
                      // Circle at top center
                      Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        alignment: Alignment.center,
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                      ),
        
                      // First container
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        height: 200,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
        
                      // Second container
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        height: 200,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
    required this.controller,
    required this.data,
  });

  final SettingsController controller;
  final Map<String, dynamic>? data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        Center(
          child: Stack(
            children: [
              controller.user.value.hasImage
                  ? Container(
                      height: 37.h,
                      width: 37.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/accountinfor/0.png'))),
                      child: ClipOval(
                        child: Image.file(
                          File(controller.user.value.imagePath),
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.person, color: Colors.grey[600]);
                          },
                        ),
                      ),
                    )
                  : Container(
                      height: 50.h,
                      width: 50.h,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/accountinfor/0.png')),
                          color: Colors.white,
                          shape: BoxShape.circle),
                    ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 8.r,
                      child: Icon(
                        Icons.edit_outlined,
                        size: 10.h,
                        color: Colors.black,
                      )))
            ],
          ),
        ),
        SizedBox(
          height: 25.h,
        ),
        RightAndLeft(
          text: "Email addresses",
        ),
        SizedBox(height: 10.h),
        Container(
          padding: EdgeInsets.only(left: 8.w, top: 10.h, bottom: 10.h),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 15.h,
                width: 15.h,
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/usedetails/0.png'))),
              ),
              SizedBox(
                width: 15.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 2.h, horizontal: 3.w),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(3.r)),
                        child: Text(
                          'Primary',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(fontSize: 7.sp, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    controller.user.value.email,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 9.sp, color: Colors.black.withOpacity(1)),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 15.h),
        RightAndLeft(
          text: "Phone Numbers",
        ),
        SizedBox(height: 10.h),
        Container(
          padding: EdgeInsets.only(left: 8.w, top: 10.h, bottom: 10.h),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 15.h,
                width: 15.h,
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/usedetails/1.png'))),
              ),
              SizedBox(
                width: 15.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 2.h, horizontal: 3.w),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(3.r)),
                        child: Text(
                          'Primary',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(fontSize: 7.sp, color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    AppUtilities().obfuscatePhoneNumber(data!['phone']),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 10.sp, color: Colors.black.withOpacity(1)),
                  ),
                  Text(
                    'Mobile',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 9.sp, color: Colors.black.withOpacity(0.4)),
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 15.h),
        RightAndLeft(
          text: 'Addresses',
        ),
        SizedBox(height: 10.h),
        Container(
          padding: EdgeInsets.only(left: 8.w, top: 10.h, bottom: 10.h),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 12.h,
                width: 12.h,
                decoration: BoxDecoration(
                    // color: Colors.red,

                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/usedetails/2.png'))),
              ),
              SizedBox(
                width: 15.w,
              ),
              Text(
                controller.user.value.address.replaceAll(',', '\n'),
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontSize: 9.sp, color: Colors.black),
              )
            ],
          ),
        )
      ],
    );
  }
}

class RightAndLeft extends StatelessWidget {
  const RightAndLeft({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w700,
                )),
        Row(
          children: [
            Text('See All',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(0.6),
                    )),
            Icon(
              Icons.arrow_forward_ios,
              size: 7.h,
              color: Colors.black.withOpacity(0.6),
            )
          ],
        )
      ],
    );
  }
}
