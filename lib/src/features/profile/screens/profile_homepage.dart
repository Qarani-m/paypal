import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:paypal/src/constants/images.dart';
import 'package:paypal/src/features/payments/screens/payments_homepgae.dart';
import 'package:paypal/src/features/profile/screens/add_bank.dart';
import 'package:paypal/src/features/profile/screens/scan_your%20card.dart';
import 'package:paypal/src/features/settings/screens/settings_homapage.dart';
import 'package:paypal/src/features/wallet/screens/preferences.dart';
import 'package:paypal/src/features/wallet/screens/wallet_homepage.dart';

class ProfileHomepage extends StatelessWidget {
  const ProfileHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 12.sp), // Adjust size here
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Color(0xFFeff2f9),
        centerTitle: true,
        title: Text(
          "Menu",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black.withOpacity(1)),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 13.w, right: 20.w, top: 20.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Shop and save',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w700,
                        )),
              ),
              SizedBox(
                height: 7.h,
              ),
              WhiteSpace(
                icon: 'shopandsave',
                texts: ['Rewards', 'Package Tracking'],
              ),
              SizedBox(
                height: 7.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Manage finances',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
 
                          fontSize: 10.sp,

                          fontWeight: FontWeight.w700,
                        )),
              ),
              SizedBox(
                height: 7.h,
              ),
              WhiteSpace(
                icon: 'managefinances',
                texts: [
                  'Crypto',
                  'Payment preferences',
                  'Add bank accounts and cards'
                ],
              ),
              SizedBox(
                height: 7.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Send and pay',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w700,
                        )),
              ),
              SizedBox(
                height: 7.h,
              ),
              WhiteSpace(icon: 'sendandpay', texts: [
                'Send to a PayPal account',
                'Mobile wallet transfers',
                'Send to a bank account',
                'Send to a debit card ',
                'Send cash for pick up',
                'Reload phones',
                'Paybills',
                'In-person & QR code',
              ]),
              SizedBox(
                height: 7.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Get paid',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w700,
                        )),
              ),
              SizedBox(
                height: 7.h,
              ),
              WhiteSpace(
                icon: 'getpaid',
                texts: [
                  'Request money',
                  'Pool money',
                  'Sell QR code',
                  'Raise money',
                  'Split the bill'
                ],
                showTwo: false,
              ),
              SizedBox(
                height: 7.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Profile and support',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w700,
                        )),
              ),
              SizedBox(
                height: 7.h,
              ),
              WhiteSpace(
                  icon: 'profileandsupport',
                  texts: ['Your Profile', 'Your wallet', 'Help Centre']),
              SizedBox(
                height: 7.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}





class WhiteSpace extends StatelessWidget {
  WhiteSpace({
    this.showTwo = true,
    super.key,
    required this.icon,
    required this.texts,
  });

  final String icon;
  final List<String> texts;
  final bool showTwo;

  Map<String, dynamic> nextPages = {
    'Payment preferences': Preferences(),
    'Add banks and cards': '',
    'Send to a PayPal account': '',
    'Pay bills': PaymentsHomepgae(index: 1),
    'Request money': PaymentsHomepgae(index: 2),
    'Your profile': SettingsHomapage(),
    'Your wallet': WalletHomepage(),
  };

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        padding: EdgeInsets.only(left: 10.w, top: 8.h, bottom: 8.h),
        child: ThaSpaces(
          icon: icon,
          texts: texts,
        ));
  }
}

class ThaSpaces extends StatelessWidget {
  const ThaSpaces({
    this.showTwo = true,
    super.key,
    required this.icon,
    required this.texts,
  });

  final String icon;
  final List<String> texts;
  final bool showTwo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            SizedBox(
              height: 13.h,
            ),
            GestureDetector(
                onTap: () => b2(context),
                child: Column(
                  children: List.generate(
                    texts.length,
                    (index) => Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                           icon.length>1? Container(
                              height: 20.h,
                              width: 20.h,
                              decoration: BoxDecoration(
                              // color: Colors.red,

                                image: DecorationImage(image: AssetImage('assets/images/$icon/${index}.png'))
                              ),
                            ):
                            SvgPicture.asset(
                              AppImages.onlinePurchases,
                              height: 15.h,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              texts[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      fontSize:8.5.sp, color: Colors.black),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        )
      ],
    );
  }

  void b2(BuildContext context) {
    if ('text2' == 'Add banks and cards') {
      Get.bottomSheet(Container(
        height: 100.h,
        padding: EdgeInsets.only(left: 10.w, right: 5.w, bottom: 4.h),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.r),
              topRight: Radius.circular(15.r),
            )),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      'Add to Wallet',
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
            SizedBox(
              height: 3.h,
            ),
            GestureDetector(
              onTap: () {
                Get.back();

                Get.to(AddBank());
              },
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppImages.bank,
                    height: 15.h,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bank accounts",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 7.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(1)),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        "Transfer money you recieve to your bank account",
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
              height: 15.h,
            ),
            GestureDetector(
              onTap: () {
                Get.back();
                Get.bottomSheet(Container(
                  padding: EdgeInsets.only(
                      left: 15.w, right: 15.w, bottom: 4.h, top: 6.h),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.r),
                        topRight: Radius.circular(15.r),
                      )),
                  height: 70.h,
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.arrow_back,
                            color: Colors.black54,
                            size: 10.sp,
                          ),
                          Text(
                            "Link your card",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontSize: 6.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black.withOpacity(1)),
                          ),
                          Icon(
                            Icons.close,
                            color: Colors.black54,
                            size: 10.sp,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      GestureDetector(
                        onTap: () => Get.to(ScanYourCard()),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              AppImages.bank,
                              height: 12.h,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Scan your card",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
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
                        height: 9.h,
                      ),
                      GestureDetector(
                        onTap: () => b1(context),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              AppImages.bank,
                              height: 12.h,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Enter your card information",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                          fontSize: 7.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black.withOpacity(1)),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ));
              },
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppImages.bank,
                    height: 15.h,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Debits and credit cards",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 7.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(1)),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        "Keep your card information secure while shopping",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 7.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(1)),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ));
    } else {
      // Get.to(nextPages[text2]);
    }
  }

  void b1(BuildContext context) {
    Get.bottomSheet(Container(
      padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 4.h, top: 6.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.r),
            topRight: Radius.circular(15.r),
          )),
      height: 200.h,
      width: double.maxFinite,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.arrow_back,
                color: Colors.black54,
                size: 10.sp,
              ),
              Text(
                "Link a card",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 6.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(1)),
              ),
              Icon(
                Icons.close,
                color: Colors.black54,
                size: 10.sp,
              )
            ],
          ),

          SizedBox(
            height: 14.h,
          ),

          GestureDetector(
            onTap: () => Get.to(ScanYourCard()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.camera_alt_outlined,
                  color: Color(0xFF0059b3),
                  size: 10.w,
                ),
                SizedBox(
                  width: 4.w,
                ),
                Text(
                  "Scan",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 6.sp,
                      fontWeight: FontWeight.w900,
                      color: Colors.blue.withOpacity(1)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            child: TextFormField(
              decoration: InputDecoration(
                filled: false,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 15.w, vertical: 7.h),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(top: 7.h),
                  child: Icon(
                    Icons.credit_card,
                    size: 12.sp,
                    color: Colors.black87,
                  ),
                ),
                hintText: 'Card number',
                hintStyle: TextStyle(fontSize: 7.sp, color: Colors.black54),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.r),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]!),
                ),
              ),
            ),
          ),

          SizedBox(
            height: 5.h,
          ),
          // For expiry and CVV row
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: false,
                    hintText: 'Expiry',
                    hintStyle: TextStyle(fontSize: 7.sp, color: Colors.black54),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: false,
                    hintText: 'CVV',
                    hintStyle: TextStyle(fontSize: 7.sp, color: Colors.black54),
                    suffixIcon: Icon(
                      Icons.help_outline,
                      size: 10.sp,
                      color: Color(0xFF0059b3),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(
            height: 5.h,
          ),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Billing address",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 6.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(0.5)),
              ),
              Text(
                "Change",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 6.sp,
                    fontWeight: FontWeight.w900,
                    color: Colors.blue.withOpacity(1)),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Billing address",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 7.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(1)),
                ),
              ),
              Text(
                "Billing address",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 7.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(1)),
              ),
              Text(
                "Billing address",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 7.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(1)),
              ),
            ],
          ),

          SizedBox(
            height: 10.h,
          ),

          Container(
            padding: EdgeInsets.symmetric(
              vertical: 5.h,
            ),
            width: double.maxFinite,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(20.r)),
            child: Text(
              'Link Card',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w900),
            ),
          ),
        ],
      ),
    ));
  }
}
