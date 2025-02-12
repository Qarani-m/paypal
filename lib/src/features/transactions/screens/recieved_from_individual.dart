import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:paypal/src/constants/images.dart';
import 'package:paypal/src/features/payments/models/payment_model.dart';
import 'package:paypal/src/features/transactions/screens/send_to_individual.dart';
import 'package:paypal/src/features/transactions/screens/show_story.dart';
import 'package:paypal/src/utils/utilities.dart';

class receivedFromIndividual extends StatelessWidget {
  const receivedFromIndividual({super.key});

  @override
  Widget build(BuildContext context) {
    final transaction = Get.arguments as PaymentModel;
    Map<String, String> nameAndSigns = {'GBP': '£', 'EUR': '€', 'USD': 'US\$'};
     List<String> belowShowStory =['send_money', 'messages'];


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
              padding: EdgeInsets.symmetric(horizontal: 13.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
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
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                      SizedBox(
                        width: 10.w,
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
                                    fontSize: 8.sp,
                                    fontWeight: FontWeight.w500,
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
                                    fontSize: 8.sp,
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
              height: 7.h,
            ),
            Container(
              height: 1.5.h,
              width: double.maxFinite,
              color: Color(0xFFeff2f9),
            ),
            SizedBox(
              height: 11.h,
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
              height: 11.h,
            ),
            Container(
              height: 1.5.h,
              width: double.maxFinite,
              color: Color(0xFFeff2f9),
            ),
            SizedBox(
              height: 17.h,
            ),
            Padding(
              padding: EdgeInsets.only(right: 70.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
              padding: EdgeInsets.only(right: 5.w),
              child:Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [




 for (int i = 0; i < 2; i++) ...[
      ActionButton(
        icon: belowShowStory[i],
        label: ['Send Money', 'Message'][i],
        onTap: () {
          // Handle tap for each action
          print('Tapped ${['Send money',  'Message'][i]}');
        },
      ),
      SizedBox(width: i != 2 ? 50.w : 20.w), // Adjust spacing between actions
    ]

  ],
)
,
            )
,
                ],
              ),
            ),
            SizedBox(
              height: 17.h,
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
                      fontSize: 8.sp,
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
                        fontSize: 9.sp,
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
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(1)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
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
                        fontSize: 9.sp,
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

class receivedFromIndividualV2 extends StatelessWidget {
  const receivedFromIndividualV2({super.key});

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
                            "${AppUtilities().formatDateMonthFirst(transaction.date)}, ${ AppUtilities().convert(transaction.time)}${int.parse(transaction.time.split(':')[0]) > 11 ? 'pm' : 'am'}",
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
              height: 13.h,
            ),
            Container(
              height: 1.5.h,
              width: double.maxFinite,
              color: Color(0xFFeff2f9),
            ),
            SizedBox(
              height: 13.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 13.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  transaction.message,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFF0059b3),
                      fontSize: 6.5.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0059b3).withOpacity(1)),
                ),
              ),
            ),
            SizedBox(
              height: 13.h,
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
              height: 13.h,
            ),
            Container(
              height: 1.5.h,
              width: double.maxFinite,
              color: Color(0xFFeff2f9),
            ),
            SizedBox(
              height: 13.h,
            ),
            Padding(
              padding: EdgeInsets.only(right: 120.w),
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
                        "Add tracking",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 7.sp,
                            fontWeight: FontWeight.w200,
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
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Details",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(1)),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Amount",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(1)),
                      ),
                      Text(
                        'US\$${transaction.amount}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(1)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Fee",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(1)),
                      ),
                      Text(
                        '-US\$${transaction.payPalFee}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(1)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w900,
                            color: Colors.black.withOpacity(1)),
                      ),
                      Text(
                        'US\$${double.parse(transaction.amount) - double.parse(transaction.payPalFee)}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w900,
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
                      fontSize: 8.sp,
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
          ],
        ),
      ),
    );
  }
}
