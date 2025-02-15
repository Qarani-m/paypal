import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paypal/src/constants/images.dart';
import 'package:paypal/src/features/payments/models/payment_model.dart';
import 'package:paypal/src/features/transactions/screens/show_history.dart';
import 'package:paypal/src/features/transactions/screens/show_story.dart';
import 'package:paypal/src/features/transactions/send_again.dart';
import 'package:paypal/src/utils/utilities.dart';

class SendToIndividual extends StatelessWidget {
  const SendToIndividual({super.key});
  @override
  Widget build(BuildContext context) {
    final transaction = Get.arguments as PaymentModel;

    List<String> howCanWeHelp = [
      'Get answers',
      'Report problem',
    ];


    Map<String, String> nameAndSigns = {'GBP': '£', 'EUR': '€', 'USD': '\$'};
    Map<String, String> nameAndSignsExtended = {'GBP': '£', 'EUR': '€', 'USD': 'US\$'};
    final storage = GetStorage();

Map<String, dynamic> userData = storage.read('user_data') ?? {};
String? currency = userData['currency']??'USD';
 
        List<IconData> howCanWeHelpIcons = [
      Icons.help_outline,
  Icons.warning_amber
    ];


    List<String> belowShowStory =[
      'send_money','i6', 'messages'
    ];

    String address = storage.read('user_data')['address'];

    bool isPaymentCompleted = false;
    // String address = 'Michael Bay\nNairobi\nKamakis\nNairobi 01000\nKenya';

    TextStyle sameTextStyle = Theme.of(context).textTheme.bodySmall!.copyWith(
        fontSize: 10.sp,
        fontWeight: FontWeight.w500,
        color: Colors.black.withOpacity(1));
    
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 15.h), // Adjust size here
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Money sent",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 10.sp,
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
                              height: 34.h,
                              width: 34.h,
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
                              height: 30.h,
                              width: 30.h,
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
                                    fontSize: 9.5.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black.withOpacity(1)),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            "${AppUtilities().formatDateMonthFirst(transaction.date)}, ${ AppUtilities().convert(transaction.time)}${int.parse(transaction.time.split(':')[0]) > 11 ? 'pm' : 'am'}",
                            // '',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontSize: 8.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black.withOpacity(1)),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          // GestureDetector(
                          //   onTap: () => Get.to(ShowHistory()),
                          //   child: Text(
                          //     "Show history",
                          //     style: Theme.of(context)
                          //         .textTheme
                          //         .bodySmall
                          //         ?.copyWith(
                          //             decoration: TextDecoration.underline,
                          //             decorationColor: Color(0xFF0059b3),
                          //             fontSize: 6.5.sp,
                          //             fontWeight: FontWeight.w700,
                          //             color: Color(0xFF0059b3).withOpacity(1)),
                          //   ),
                          // ),

                          Text(
                            "You paid a ${nameAndSigns[transaction.currency]}${AppUtilities().formatNumber(transaction.payPalFee)} transaction fee",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontSize: 8.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black.withOpacity(1)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    "-${nameAndSigns[transaction.currency]}${AppUtilities().formatNumber(transaction.amount)}",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w800,
                        color: const Color.fromARGB(255, 8, 20, 8)
                            .withOpacity(1)),
                  ),
                ],
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
              height: 11.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 13.w),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      transaction.message,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 7.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(1)),
                    ),
                  ),
                  SizedBox(
                    height: 11.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(ShowStory());
                      },
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
                ],
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
              height: 11.h,
            ),
            Padding(
              padding: EdgeInsets.only(right: 5.w),
              child:Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    for (int i = 0; i < 3; i++) ...[
      GestureDetector(
        onTap: (){
          Get.to(PaymentPage(transaction:transaction));
        },
        child: ActionButton(
          icon: belowShowStory[i],
          label: ['Send again', 'Split payment', 'Message'][i],
          onTap: () {
            // Handle tap for each action
          },
        ),
      ),
      SizedBox(width: i != 2 ? 50.w : 20.w), // Adjust spacing between actions
    ]
  ],
)
,
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
              height: 11.h,
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
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Get.bottomSheet(
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 13.w),

                            decoration: BoxDecoration(
// color: Colors.blue,

                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(16)),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
// color: Colors.red,
padding: EdgeInsets.only(top: 8.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 9.sp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                                  Text(
                                        'Payment info',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 9.sp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      
                                      Row(
                                        children: [
                                          Icon(
                                              Icons.close,
                                              size: 10.h,
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20.h,),
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
                                            "${nameAndSignsExtended[transaction.currency]}${AppUtilities().formatNumber(transaction.amount)}",
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
                                    SizedBox(height: 20.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Amount',
                                          style: sameTextStyle,
                                        ),
                                        Text(
                                          '${nameAndSignsExtended[transaction.currency]}${(double.parse(transaction.amount)-double.parse(transaction.payPalFee)).toStringAsFixed(0) }',
                                          style: sameTextStyle,
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 13.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Fee',
                                          style: sameTextStyle,
                                        ),
                                        Text(
                                          '${nameAndSignsExtended[transaction.currency]}${transaction.payPalFee}',
                                          style: sameTextStyle,
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 13.h),
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
                                          '${nameAndSignsExtended[transaction.currency]}${transaction.amount}',
                                          style: sameTextStyle.copyWith(
                                              fontWeight: FontWeight.w800),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                transaction.currency == currency
                                    ? Column()
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text('Exchange rate- ',
                                                  style: sameTextStyle),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              Icon(
                                                Icons.help_outline_sharp,
                                                color: Colors.blue,
                                                size: 17.w,
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          Text(
                                              '${nameAndSigns[transaction.currency]}${transaction.amount} ${transaction.currency} = \$${double.parse(transaction.amount) * double.parse(transaction.exchangeRate)} USD',
                                              style: sameTextStyle),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          Text(
                                              '1 ${transaction.currency} = ${transaction.exchangeRate} $currency',
                                              style: sameTextStyle),
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
                                            Text('For', style: sameTextStyle),
                                            SizedBox(height: 8.h),
                                            Text('Friends and family',
                                                style: sameTextStyle),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 16.h,
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
                        "Show payment information",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 9.5.sp,
                            fontWeight: FontWeight.w800,
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xFF0059b3),
                            color: Color(0xFF0059b3).withOpacity(1)),
                      ),
                    ),
                  ),
                ],
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
              height: 11.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 13.w),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "How can we help?",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(1)),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 13.w),
                    child: Column(
                        children: List.generate(
                            2,
                            (index) => Padding(
                                  padding: EdgeInsets.only(
                                      bottom: index == 3 ? 16.h : 30.h),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                     Icon(howCanWeHelpIcons[index]),
                                      // SvgPicture.asset(
                                      //     howCanWeHelpImages[index]),
                                      SizedBox(
                                        width: 14.w,
                                      ),
                                      Text(
                                        howCanWeHelp[index],
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                fontSize: 8.5.sp,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black
                                                    .withOpacity(1)),
                                      ),
                                    ],
                                  ),
                                ))),
                  )
                ],
              ),
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







          ],
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final String icon;

  const ActionButton({
    required this.label,
    this.onTap,
    super.key, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: icon=='i6'?10.r:13.r,
          backgroundImage: AssetImage('assets/images/$icon.png'),
        ),
        SizedBox(height:icon=='i6'?5.h: 3.h),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 8.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(1),
              ),
        ),
      ],
    );
  }
}
