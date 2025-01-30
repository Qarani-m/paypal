import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:paypal/src/constants/images.dart';
import 'package:paypal/src/features/payments/models/payment_model.dart';
import 'package:paypal/src/utils/utilities.dart';

class SentToBank extends StatelessWidget {
  const SentToBank({super.key});

  @override
  Widget build(BuildContext context) {
    final transaction = Get.arguments as PaymentModel;


    bool isPaymentCompleted = false;


    TextStyle sameTextStyle = Theme.of(context).textTheme.bodySmall!.copyWith(
        fontSize: 8.sp,
        fontWeight: FontWeight.w500,
        color: Colors.black.withOpacity(1));





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
          "Payment",
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
                        padding: EdgeInsets.all(6.5.h),
                        child: SvgPicture.asset(AppImages.bank,
                            height: 12.h, width: 12.h),
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
                            "${AppUtilities().formatDateMonthFirst(transaction.date)}, ${transaction.time} ${int.parse(transaction.time.split(':')[0]) > 11 ? 'pm' : 'am'}",
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
                            "Show story",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xFF0059b3),
                                    fontSize: 6.5.sp,
                                    fontWeight: FontWeight.w700,
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
                        fontWeight: FontWeight.w700,
                        color: Colors.black.withOpacity(0.8)),
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
                      "From",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 7.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(1)),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "PayPal balance",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 7.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(1)),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                     onTap: () {
                        Get.bottomSheet(
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 13.w),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(16)),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            'Payment info',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 8.sp,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.close,
                                          size: 10.h,
                                        ),
                                        onPressed: () => Get.back(),
                                      ),
                                    ],
                                  ),
                                ),
                                !isPaymentCompleted
                                    ? Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          // margin: EdgeInsets.symmetric(horizontal: 16),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4.w, vertical: 3.5.h),
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(Icons.check_circle_outline,
                                                  color: Colors.white,
                                                  size: 10.h),
                                              SizedBox(width: 4),
                                              Text('Completed',
                                                  style: TextStyle(
                                                      fontSize: 7.sp,
                                                      color: Colors.white)),
                                            ],
                                          ),
                                        ),
                                      )
                                    : Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          // margin: EdgeInsets.symmetric(horizontal: 16),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4.w, vertical: 3.5.h),
                                          decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(Icons.priority_high_rounded,
                                                  color: Colors.white,
                                                  size: 10.h),
                                              SizedBox(width: 4),
                                              Text('Inprogress',
                                                  style: TextStyle(
                                                      fontSize: 7.sp,
                                                      color: Colors.white)),
                                            ],
                                          ),
                                        ),
                                      ),




















                                      
                                SizedBox(height: 10.h),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('From', style: sameTextStyle),
                                            SizedBox(
                                              height: 6.h,
                                            ),
                                            Text('PayPal balance',
                                                style: sameTextStyle),
                                          ],
                                        ),
                                        Text(
                    "US\$${AppUtilities().formatNumber(transaction.amount)}",
                                          
                                           style: sameTextStyle),
                                      ],
                                    ),
                                    SizedBox(height: 17.h),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Details', style: sameTextStyle),
                                    SizedBox(height: 17.h),

                                     Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          transaction.name,
                                          style: sameTextStyle,
                                        ),
                                        Text(
                                          'US\$${transaction.amount}',
                                          style: sameTextStyle,
                                        )
                                      ],
                                    ),
                                            SizedBox(height: 8.h),

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Amount',
                                          style: sameTextStyle,
                                        ),
                                        Text(
                                          'US\$${transaction.amount}',
                                          style: sameTextStyle,
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Total',
                                          style: sameTextStyle.copyWith(
                                              fontWeight: FontWeight.w800),
                                        ),
                                        Text(
                                          'US\$${transaction.amount}',
                                          style: sameTextStyle.copyWith(
                                              fontWeight: FontWeight.w800),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 17.h,
                                ),



Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Invoice ID',
                                                style: sameTextStyle),
                                            SizedBox(height: 8.h),
                                            Text(transaction.transactionCode.split('').reversed.join(),
                                                style: sameTextStyle),
                                          ],
                                        ),
                                        Icon(Icons.copy, size: 10.h)
                                      ],
                                    ),
                                  ],
                                ),



                   SizedBox(
                                  height: 17.h,
                                ),


                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Transaction ID',
                                                style: sameTextStyle),
                                            SizedBox(height: 8.h),
                                            Text(transaction.transactionCode,
                                                style: sameTextStyle),
                                          ],
                                        ),
                                        Icon(Icons.copy, size: 10.h)
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.h),
                              ],
                            ),
                          ),
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                        );
                      },
                      child: Text(
                        "Show payment info",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xFF0059b3),
                            fontSize: 6.5.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF0059b3).withOpacity(1)),
                      ),
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
              padding: EdgeInsets.symmetric(horizontal: 13.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "You and ${transaction.name}",
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
              height: 13.h,
            ),
            Container(
              height: 1.5.h,
              width: double.maxFinite,
              color: Color(0xFFeff2f9),
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
