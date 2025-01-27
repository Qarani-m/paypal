import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paypal/src/constants/images.dart';
import 'package:paypal/src/features/home/controllers/homepage_controller.dart';
import 'package:paypal/src/features/home/widgets/homepage_buttons.dart';
import 'package:paypal/src/features/payments/models/payment_model.dart';
import 'package:paypal/src/features/transactions/screens/recieved_from_individual.dart';
import 'package:paypal/src/utils/utilities.dart';

class PayFromYourPhone extends StatelessWidget {
  const PayFromYourPhone({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(6.r)),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 20.h,
                width: 30.w,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage(AppImages.atmCard))),
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pay From Your Phone",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(1)),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    "For the things you love",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 7.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(1)),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "Send now",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                decoration: TextDecoration.underline,
                decorationColor:
                    const Color.fromARGB(255, 32, 118, 188).withOpacity(1),
                fontSize: 6.5.sp,
                fontWeight: FontWeight.w700,
                color: const Color.fromARGB(255, 32, 118, 188).withOpacity(1)),
          )
        ],
      ),
    );
  }
}

class PayPalBalance extends StatelessWidget {
  const PayPalBalance({
    super.key,
    required this.balance,
    required this.currency,
  });

  final String balance;
  final String currency;

  @override
  Widget build(BuildContext context) {
    Map<String, String> currencies = {'USD': '\$'};
    return Container(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(6.r)),
        child: Row(
          children: [
            Container(
              height: 9.h,
              width: 9.h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppImages.paypalLogo1))),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${currencies['$currency']}${AppUtilities().formatNumber(balance)}",
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontWeight: FontWeight.w900, fontSize: 14.sp),
                  ),
                  Text("PayPal balance",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w400, fontSize: 7.sp)),
                ],
              ),
            ),
          ],
        ));
  }
}

class SettingAndProfileMenu extends StatelessWidget {
  const SettingAndProfileMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Get.toNamed('/settings'),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 11.r,
            child: Icon(
              Icons.menu,
              size: 10.h,
              color: Color(0xFF0059b3),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => Get.toNamed("/profile"),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 11.r,
            child: Icon(
              Icons.person_2_outlined,
              size: 10.h,
              color: Color(0xFF0059b3),
              weight: 0.1,
            ),
          ),
        )
      ],
    );
  }
}

class PaymentContainer extends StatelessWidget {
  const PaymentContainer({
    super.key,
    required this.index,
    required this.name,
    required this.amount,
    required this.showDetails,
    required this.isRecieved,
    required this.homepageController,
    required this.hasImage,
    required this.date,
    required this.message,
    required this.imagePath,
    required this.id,
    required this.category,
    required this.transaction,
  });
  final int index;
  final String name;
  final String date;
  final String amount;
  final bool showDetails;
  final bool hasImage;
  final String message;
  final String isRecieved;
  final String imagePath;
  final int id;
  final HomepageController homepageController;
  final PaymentModel transaction;
  final String category;

  @override
  Widget build(BuildContext context) {
    bool isRecievedB = isRecieved == 'recieve';

    return GestureDetector(
      onDoubleTap: () => homepageController.updateTransaction(id),
      onLongPress: () => homepageController.deleteTransactions(id),
      onTap: () {
        print(category);
        if (category == 'Send,Individual') {
          Get.toNamed('/send_to_individual', arguments: transaction);
        }

        if (category == 'Send,Org') {
          Get.toNamed('/send_to_org', arguments: transaction);
        }

        if (category == 'Send,Bank') {
          Get.toNamed('/sent_to_bank', arguments: transaction);
        }
        if (category == 'Paypal,Refund') {
          Get.toNamed('/refund', arguments: transaction);
        }


         if (category == 'Paypal,Recovery') {
          Get.toNamed('/paypal_recovery', arguments: transaction);
        }

        if (category == 'recieve,Individual') {
          if (message.trim().length > 0) {
            Get.to(RecievedFromIndividualV2(), arguments: transaction);
            return;
          }

          Get.toNamed('/recieved_from_individual', arguments: transaction);
        }

        if (category == 'recieve,Org') {
          Get.toNamed('/recieved_from_org', arguments: transaction);
        }
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(color: Color(0xFFeff2f9), width: 0.8.h)),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(index == 0 ? 10.r : 0),
              topRight: Radius.circular(index == 0 ? 10.r : 0),
            )),
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        child: Column(
          children: [
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Leading Circle

                  hasImage
                      ? Container(
                          height: 32.h,
                          width: 32.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[300],
                          ),
                          child: ClipOval(
                            child: Image.file(
                              File(imagePath),
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
                            AppUtilities().getInitials(name),
                            style: TextStyle(
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                  SizedBox(width: 7.w), // Spacing between the circle and text

                  // Title and Subtitle
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          name,
                          style: TextStyle(
                              fontSize: 7.5.sp,
                              fontWeight: FontWeight.w800,
                              color: Colors.black),
                        ),

                        // Subtitle
                        Text(
                          AppUtilities().formatDateDateFirst(date),
                          style: TextStyle(
                            fontSize: 7.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  homepageController.getCategory(
                      '${transaction.type},${transaction.direction}'),
                  style: TextStyle(
                      fontSize: 6.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
                Text(
                  '${isRecievedB ? "+ " : "- "}US\$${AppUtilities().formatNumber(amount.split(' ')[0])}',
                  // '${isRecievedB ? "+ " : "- "}US\$${amount}',
                  style: TextStyle(
                      fontSize: 7.5.sp,
                      fontWeight: FontWeight.w800,
                      color: isRecievedB
                          ? const Color.fromARGB(255, 38, 126, 41)
                          : Colors.black),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 6.h,
                ),
                showDetails
                    ? !category.contains('Paypal')
                        ? Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '"$message"',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                          fontSize: 6.5.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black.withOpacity(1)),
                                ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 3.h, horizontal: 8.w),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius:
                                          BorderRadius.circular(20.r)),
                                  child: Text(
                                    'Add tracking',
                                    style: TextStyle(
                                        fontSize: 7.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black.withOpacity(0.8)),
                                  ),
                                ),
                              )
                            ],
                          )
                        : Container(
                            height: 0,
                            width: 0,
                            color: Colors.red,
                          )
                    : Container(
                        height: 0,
                        width: 0,
                        color: Colors.black,
                      ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Homepage1 extends GetView<HomepageController> {
  const Homepage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFebedf3),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.only(left: 13.w, right: 13.w, top: 30.h),
            color: Colors.red,
            height: 100,
            width: double.maxFinite,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Get.toNamed('/settings'),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 11.r,
                        child: Icon(
                          Icons.menu,
                          size: 10.h,
                          color: Color(0xFF0059b3),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed("/profile"),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 11.r,
                        child: Icon(
                          Icons.person_2_outlined,
                          size: 10.h,
                          color: Color(0xFF0059b3),
                          weight: 0.1,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  color: Colors.white,
                  child: ListTile(
                    leading: Container(
                      height: 20.h,
                      width: 20.h,
                      color: Colors.red,
                    ),
                    title: Text(
                      "\$0.00",
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge
                          ?.copyWith(fontWeight: FontWeight.w800),
                    ),
                    subtitle: Text("PayPal balance",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w400)),
                  ),
                )
              ],
            ),
          )),
          HomepageButtonContainer(
            textLeft: "Send",
            textRight: "Request",
          )
        ],
      ),
    );
  }
}
