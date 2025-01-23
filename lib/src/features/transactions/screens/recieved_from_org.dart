import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paypal/src/constants/images.dart';

class RecievedFromOrg extends StatelessWidget {
  const RecievedFromOrg({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
                leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 12.sp), // Adjust size here
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Money recieved",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 8.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black.withOpacity(1)),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10.h, left: 0.w, right: 0.w),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 28.h,
                        width: 28.h,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "PayPal",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontSize: 8.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black.withOpacity(1)),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            "Nov 22,05:26 am",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontSize: 7.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black.withOpacity(1)),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            "Show history",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.blue,
                                    fontSize: 6.5.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.blue.withOpacity(1)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    "+US\$40.54",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.green.withOpacity(1)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            Container(
              height: 1.5.h,
              width: double.maxFinite,
              color: Color(0xFFeff2f9),
            ),
            SizedBox(
              height: 7.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 13.w),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Dj fresh",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 7.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(1)),
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Show story",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blue,
                          fontSize: 6.5.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.blue.withOpacity(1)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            Container(
              height: 1.5.h,
              width: double.maxFinite,
              color: Color(0xFFeff2f9),
            ),
            SizedBox(
              height: 7.h,
            ),
            Padding(
              padding: EdgeInsets.only(right: 70.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 17.r,
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        "Message",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 7.sp,
                            fontWeight: FontWeight.w200,
                            color: Colors.black.withOpacity(1)),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            Container(
              height: 1.5.h,
              width: double.maxFinite,
              color: Color(0xFFeff2f9),
            ),
            SizedBox(
              height: 7.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "You and Tommas robinson LLC",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 7.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(1)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.w),
              child: Row(
                children: [
                  SvgPicture.asset(AppImages.email),
                  SizedBox(
                    width: 7.h,
                  ),
                  Text(
                    "Email address",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 7.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(1)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            Container(
              height: 1.5.h,
              width: double.maxFinite,
              color: Color(0xFFeff2f9),
            ),
            SizedBox(
              height: 7.h,
            ),





              Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Transaction ID",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 6.5.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(1)),
                ),
              ),
            ),
  SizedBox(
              height: 10.h,
            ),
          
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "839FSIDJFBSJFHWI378WEIF",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 6.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(1)),
                  ),
                  Icon(
                    Icons.copy,
                    size: 7.h,
                  )
                ],
              ),
            ),









            SizedBox(
              height: 16.h,
            ),
            Container(
              height: 1.5.h,
              width: double.maxFinite,
              color: Color(0xFFeff2f9),
            ),
            SizedBox(
              height: 7.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 13.w),
              child: Row(
                children: [
                  SvgPicture.asset(AppImages.copy),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    "Report Melinda",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 6.5.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(1)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 9.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 13.w),
              child: Row(
                children: [
                  SvgPicture.asset(AppImages.copy),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    "Block Melinda",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 6.5.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(1)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 9.h,
            ),
            Container(
              height: 1.5.h,
              width: double.maxFinite,
              color: Color(0xFFeff2f9),
            ),
                  
          ],
        ),
      ),
    );
  }
}
