import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:paypal/src/features/settings/controllers/settings_controller.dart';

class PersonaInfor extends GetView<SettingsController> {
  const PersonaInfor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Account information",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 9.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black.withOpacity(1)),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 3.h),
        child: Column(
          children: [
            SizedBox(height: 30.h,),

            Center(
              child: Stack(
                children: [
                  Container(
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
            SizedBox(height: 25.h,),
            RightAndLeft(
              text: "Email addresses",
            ),
            SizedBox(height: 10.h),
            Container(
              padding: EdgeInsets.only(left: 8.w, top: 10.h, bottom: 10.h),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/svg/house.svg',
                    height: 10.h,
                  ),
                  SizedBox(
                    width: 8.w,
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
                                  ?.copyWith(
                                      fontSize: 6.sp, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'emqarani@gmail.com',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 7.sp, color: Colors.black.withOpacity(1)),
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
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/svg/house.svg',
                    height: 11.h,
                  ),
                  SizedBox(
                    width: 8.w,
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
                                  ?.copyWith(
                                      fontSize: 6.sp, color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 2.h, horizontal: 3.w),
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(3.r)),
                            child: Text(
                              'Unconfirmed',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      fontSize: 6.sp, color: Colors.black),
                            ),
                          )
                        ],
                      ),
                      Text(
                        '7** **7676',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 7.sp, color: Colors.black.withOpacity(1)),
                      ),
                      Text(
                        'Mobile',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 7.sp,
                            color: Colors.black.withOpacity(0.4)),
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
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/svg/house.svg',
                    height: 11.h,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    '10345 Braodway\nNairobi, 10022\nNairobi, Kenya',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: 7.sp, color: Colors.black),
                  )
                ],
              ),
            )
          ],
        ),
      ),
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
                  fontSize: 9.sp,
                  fontWeight: FontWeight.w700,
                )),
        Row(
          children: [
            Text('See All',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 7.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(0.3),
                    )),
            Icon(
              Icons.arrow_forward_ios,
              size: 9.h,
              color: Colors.black.withOpacity(0.3),
            )
          ],
        )
      ],
    );
  }
}
