import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paypal/src/features/payments/models/payment_model.dart';
import 'package:paypal/src/utils/utilities.dart';

class Refund extends StatelessWidget {
  const Refund({super.key});

  @override
  Widget build(BuildContext context) {
    final transaction = Get.arguments as PaymentModel;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 12.sp), // Adjust size here
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Refund sent - Completed",
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
                      transaction.hasProfilePic
                          ? Container(
                              height: 32.h,
                              width: 32.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey[300],
                              ),
                              child: ClipOval(
                                child: Image.file(
                                  File(transaction.imagePath),
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(Icons.person,
                                        color: Colors.grey[600]);
                                  },
                                ),
                              ),
                            )
                          : Container(
                              alignment: Alignment.center,
                              height: 27.h,
                              width: 27.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xFF2e3333),
                              ),
                              child: Text(
                                AppUtilities().getInitials(transaction.name),
                                style: TextStyle(
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transaction.name,
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
                            "${AppUtilities().formatDateMonthFirst(transaction.date)}, ${transaction.time} ${int.parse(transaction.time.split(':')[0]) > 11 ? 'pmm' : 'am'}",
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
                                    decorationColor: Color(0xFF0059b3),
                                    fontSize: 6.5.sp,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xFF0059b3).withOpacity(1)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    "-US\$${AppUtilities().formatNumber(transaction.amount)}",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 8.sp,
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
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 13.w),
              child: Row(
                children: [
                  Icon(
                    Icons.info,
                    size: 10.h,
                    color: Colors.black54,
                  ),
                  SizedBox(width: 9.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "The Original purchase was on ${AppUtilities().formatDateLong(transaction.date)}",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 6.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(1)),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      GestureDetector(
onTap: (){
  Get.to(RefundDetails());
},

                        child: Text(
                          "View details",
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: 6.5.sp,
                              fontWeight: FontWeight.w800,
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xFF0059b3),
                              color: Color(0xFF0059b3).withOpacity(1)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
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
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "From",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 7.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(1)),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
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
                        "-US\$${AppUtilities().formatNumber(transaction.amount)}",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 7.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(1)),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 14.h,
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
                    transaction.transactionCode,
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
              height: 6.h,
            ),
            SizedBox(
              height: 16.h,
            ),
          ],
        ),
      ),
    );
  }
}





class RefundDetails extends StatelessWidget {
  const RefundDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 12.sp), // Adjust size here
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Money recieved",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 8.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black.withOpacity(1)),
        ),
      ),

    );
  }
}