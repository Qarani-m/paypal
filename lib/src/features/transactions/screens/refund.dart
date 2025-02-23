import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';

import 'package:paypal/src/constants/images.dart';
import 'package:paypal/src/features/payments/models/payment_model.dart';
import 'package:paypal/src/features/transactions/screens/send_to_individual.dart';
import 'package:paypal/src/features/transactions/screens/show_story.dart';
import 'package:paypal/src/utils/utilities.dart';
import 'package:shimmer/shimmer.dart';

class Refund extends StatelessWidget {
   Refund({super.key});
      final SendtoIndiviualController controller =
        Get.put<SendtoIndiviualController>(SendtoIndiviualController());

  @override
  Widget build(BuildContext context) {
    final transaction = Get.arguments as PaymentModel;
    Map<String, String> nameAndSigns = {'GBP': '£', 'EUR': '€', 'USD': 'US\$'};
    Future.delayed(const Duration(milliseconds: 1000), () {
      controller.showContent.value = false;
    });
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 12.sp), // Adjust size here
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title:  Obx(()=>Text(
                controller.showContent.value?'':    "Refund sent",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black.withOpacity(1)),
          ),
        ),
      ),
      body: Obx(()=>Padding(
          padding: EdgeInsets.only(top: 10.h, left: 0.w, right: 0.w),
          child: controller.showContent.value
                ? Padding(
                    padding: EdgeInsets.only(left: 13.w),
                    child: Column(children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildShimmerBox(11, 60.w,
                                  radius: 6, distance: 6.h),
                              Container(
                                height: 34.h,
                                width: 34.h,
                                margin: EdgeInsets.only(
                                    bottom: 8.h), // Add spacing if needed
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!.withOpacity(0.4),
                                  highlightColor:
                                      Colors.grey[100]!.withOpacity(0.1),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 17.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildShimmerBox(
                                  11,
                                  160.w,
                                  radius: 6,
                                  distance: 6.h,
                                ),
                                _buildShimmerBox(
                                  11,
                                  120.w,
                                  radius: 6,
                                  distance: 6.h,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 17.h),
                            child: _buildShimmerBox(
                              10,
                              60.w,
                              radius: 6,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Column(
                        children: shimmerPlaceholders(),
                      )
                    ]),
                  )
                : TheMainRefundBody(transaction: transaction, nameAndSigns: nameAndSigns),
        ),
      ),
    );
  }


    List<double> shimmerHeights = [60, 11, 10, 60];

  List<Widget> shimmerPlaceholders() {
    return shimmerHeights
        .map((height) => _buildShimmerBox(height, double.infinity))
        .toList();
  }

  Widget _buildShimmerBox(double height, double width,
      {double radius = 10, double distance = 23}) {
    return Column(
      children: [
        Container(
          width: width,
          height: height.h,
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!.withOpacity(0.4),
            highlightColor: Colors.grey[100]!.withOpacity(0.1),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(radius.r),
              ),
            ),
          ),
        ),
        SizedBox(
          height: height == 11 ? distance.h : 33.h,
        )
      ],
    );
  }
}

class TheMainRefundBody extends StatelessWidget {
  const TheMainRefundBody({
    super.key,
    required this.transaction,
    required this.nameAndSigns,
  });

  final PaymentModel transaction;
  final Map<String, String> nameAndSigns;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                          height: 33.h,
                          width: 33.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFF2e3333),
                          ),
                          child: Text(
                            AppUtilities().getInitials(transaction.name),
                            style: TextStyle(
                                fontSize: 12.sp,
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
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.black.withOpacity(1)),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        "${AppUtilities().formatDateMonthFirst(transaction.date)}, ${ AppUtilities().convert(transaction.time)}${int.parse(transaction.time.split(':')[0]) > 11 ? 'pm' : 'am'}",
    
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(
                                fontSize: 9.sp,
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
                                fontSize: 8.5.sp,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF0059b3).withOpacity(1)),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                "-${nameAndSigns[transaction.currency]}${AppUtilities().formatNumber(transaction.amount)}",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(1)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        Container(
          height: 1.5.h,
          width: double.maxFinite,
          color: Color(0xFFeff2f9),
        ),
        SizedBox(
          height: 12.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 13.w),
          child: Row(
            children: [
              Icon(
                Icons.info,
                size: 13.h,
                color: Colors.black54,
              ),
              SizedBox(width: 9.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "The Original transaction was on Feb 6, 2025",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(1)),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(RefundDetails(), arguments: transaction);
                    },
                    child: Text(
                      "View details",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(
                              fontSize: 8.5.sp,
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
                      fontSize: 9.sp,
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
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(1)),
                  ),
                  Text(
                    "${nameAndSigns[transaction.currency]}${AppUtilities().formatNumber(transaction.amount)}",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 9.5.sp,
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
                  fontSize: 10.sp,
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
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(1)),
              ),
              Icon(
                Icons.copy,
                size: 12.h,
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
    );
  }
}

class RefundDetails extends StatelessWidget {
  const RefundDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final transaction = Get.arguments as PaymentModel;
    Map<String, String> nameAndSigns = {'GBP': '£', 'EUR': '€', 'USD': 'US\$'};

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
          "Money received",
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
              padding: EdgeInsets.only(left: 13.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.all(2.w),
                  width: 50.w,
                  decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(2.r)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SvgPicture.asset(
                        'assets/images/sm.svg',
                        height: 11.h,
                        width: 10.h,
                        color: Colors.white,
                      ),
                      Text(
                        "Refunded",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 6.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withOpacity(1)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
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
                              height: 35.h,
                              width: 35.h,
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
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                      SizedBox(
                        width: 10.w,
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
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black.withOpacity(1)),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            "${AppUtilities().formatDateMonthFirst(transaction.date)}, ${ AppUtilities().convert(transaction.time)}${int.parse(transaction.time.split(':')[0]) > 11 ? 'pm' : 'am'}",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontSize: 8.5.sp,
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
                                    fontSize: 8.5.sp,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xFF0059b3).withOpacity(1)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    "+${nameAndSigns[transaction.currency]}${AppUtilities().formatNumber(transaction.amount)}",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.green.withOpacity(1)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height:14.h,
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
              child: Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: ()=>Get.to(ShowStory(),arguments: transaction),
                  child: Text(
                    "Show story",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFF0059b3),
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF0059b3).withOpacity(1)),
                  ),
                ),
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
              height: 7.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 13.w),
              child: Row(
                children: [
                  Icon(
                    Icons.info,
                    size: 15.h,
                    color: Colors.black87,
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "This purchase was refunded on ${AppUtilities().formatDateLong(transaction.date)}",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(1)),
                      ),

                      SizedBox(
                            height: 7.h,
                          ),
                          Align(
                            alignment:Alignment.centerLeft,
                            child: Text(
                              "View refund",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      decoration: TextDecoration.underline,
                                      decorationColor: Color(0xFF0059b3),
                                      color: Color(0xFF0059b3),
                                      fontSize: 8.5.sp,
                                      fontWeight: FontWeight.w800,)),
                          )
                               
                    ],
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
              padding: EdgeInsets.only(right: 120.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 16.r,
                        backgroundColor: Colors.white,
                        child: Image(
                          image: AssetImage('assets/images/send_money.png'),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Send money",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black.withOpacity(1)),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 40.w,
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 16.r,
                        backgroundColor: Colors.white,
                        child: Image(
                          image: AssetImage('assets/images/messages.png'),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Message",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black.withOpacity(1)),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 12.h,
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
                      fontSize: 8.5.sp,
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
                        fontSize: 8.sp,
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
                  Image(
                    height: 15.h,
                    image: AssetImage('assets/images/0.png'),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    "Report ${transaction.name.split(' ')[0]}",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 8.sp,
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
                  Image(
                    height: 15.h,
                    image: AssetImage('assets/images/block.png'),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    "Block ${transaction.name.split(' ')[0]}      ",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 8.sp,
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
