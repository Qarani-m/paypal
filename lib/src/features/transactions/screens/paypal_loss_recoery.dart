import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaypalLossRecoery extends StatelessWidget {
  const PaypalLossRecoery({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    
    Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
                leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 12.sp), // Adjust size here
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Correction",
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
                    children: [
                      Container(
                        height: 28.h,
                        width: 28.h,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xFF0059b3)),
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
                        ],
                      ),
                    ],
                  ),
                  Text(
                    "US\$40.54",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w500,
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
                  "PayPal loss recovery",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 7.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(1)),
                ),
              ),
            ),

            SizedBox(
              height: 7.h,
            ),

            Container(
              height: 1.5.h,
              width: double.maxFinite,
              color: Color(0xFFeff2f9).withOpacity(0.4),
            ),

            SizedBox(
              height: 7.h,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "From",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 7.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(1)),
                ),
              ),
            ),

            SizedBox(
              height: 6.h,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "PayPal balance",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 7.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(1)),
                  ),
                  Text(
                    "US\$40.54",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 7.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(1)),
                  ),
                ],
              ),
            ),

// ===========================

            SizedBox(
              height: 15.h,
            ),

            Container(
              height: 1.5.h,
              width: double.maxFinite,
              color: Color(0xFFeff2f9),
            ),
            SizedBox(
              height: 10.h,
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









          ],
        ),
      ),
    );
  }
}
