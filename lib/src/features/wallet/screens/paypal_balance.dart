import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paypal/src/constants/images.dart';
import 'package:paypal/src/features/wallet/controllers/wallet_controller.dart';

class PaypalBalance extends GetView<WalletController> {
  const PaypalBalance({super.key});

  @override
  Widget build(BuildContext context) {
    bool hasImage = false;
    bool isPrimaryCurrency = true;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
                      "PayPal balance",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(1)),
                    ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 00.h, left: 10.w, right: 10.w),
        child: Column(
          children: [
            
            SizedBox(
              height: 15.h,
            ),
            Container(
              padding: EdgeInsets.only(
                  left: 10.w, right: 10.w, top: 8.h, bottom: 100.h),
              height: 220.h,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.r)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                              height: 10.h, width: 10.h, AppImages.paypalLogo1),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text("PayPalbalance",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black.withOpacity(1))),
                        ],
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("\$0.00",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w900,
                            color: Colors.black.withOpacity(0.9))),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Center(
              child: Container(
                width:
                    double.maxFinite.w, // Restricting the width of the TabBar
                decoration: BoxDecoration(
                  color: Color(0xFFf6f7fb), // Red background
                  borderRadius:
                      BorderRadius.circular(20.r), // Optional rounded corners
                ),
                child: TabBar(
                  controller: controller.paypalBalanceTabController,
                  labelColor:
                      Color(0xFFffffff), // Label color for selected tabs
                  unselectedLabelColor:
                      Colors.black87, // Label color for unselected tabs
                  indicator: BoxDecoration(
                    color: Color(0xFF0166f6), // Indicator color
                    borderRadius:
                        BorderRadius.circular(20.r), // Rounded indicator
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  onTap: controller.changePaypalTab,
                  tabs: [
                    Tab(
                      child: Text(
                        'Activity',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Currencies',
                        style: TextStyle(
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: controller.paypalBalanceTabController,
                children: [
                  // Wallet Tab Content
                  Obx(() => Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: List.generate(3, (index) {
                              return Column(
                                children: [
                                  Column(
                                    children: [
                                      OneActivityPayPalBalance(hasImage: hasImage)
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  )
                                ],
                              );
                            }),
                          ),
                          Text(
                            'Show all${controller.paypalTabIndex}',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 8.sp,
                                    color: Color(0xFF0166f6)),
                          ),
                        ],
                      )),
                  // Activity Tab Content
                  Center(
                    child: Obx(() => Column(children: [
                          Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: Colors.white),
                            padding: EdgeInsets.only(
                                top: 6.h,
                                bottom: 10.h,
                                left: 15.w,
                                right: 15.w),
                            child: Column(
                              children: [
                                Container(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // Leading Circle
                                      Container(
                                        height: 29.h,
                                        width: 29.h,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image:
                                                  AssetImage(AppImages.atmCard),
                                              fit: BoxFit.cover),
                                        ),
                                      ),

                                      SizedBox(
                                          width: 7
                                              .w), // Spacing between the circle and text

                                      // Title and Subtitle
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Title
                                            Text(
                                              "USD",
                                              style: TextStyle(
                                                  fontSize: 8.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black),
                                            ),

                                            // Subtitle
                                  isPrimaryCurrency?            Text(
                                              "Primary",
                                              style: TextStyle(
                                                fontSize: 7.5.sp,
                                                color: Colors.grey,
                                              ),
                                            ):Center(),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                        isPrimaryCurrency?    "5000":'\$0.00',
                                            style: TextStyle(
                                                fontSize: 7.5.sp,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                     !isPrimaryCurrency?     Text(
                                            "\$0.00 in USD",
                                            style: TextStyle(
                                                fontSize: 8.sp,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ):Center(),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'Show all${controller.paypalTabIndex}',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 8.sp,
                                    color: Color(0xFF0166f6)),
                          ),
                        ])),
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

class OneActivityPayPalBalance extends StatelessWidget {
  const OneActivityPayPalBalance({
    super.key,
    required this.hasImage,
  });

  final bool hasImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(5.r),
          color: Colors.white),
      padding: EdgeInsets.only(
          top: 6.h,
          bottom: 10.h,
          left: 15.w,
          right: 15.w),
      child: Column(
        children: [
          Container(
            child: Row(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                // Leading Circle
                hasImage
                    ? Container(
                        height: 32.h,
                        width: 32.h,
                        decoration:
                            BoxDecoration(
                          shape:
                              BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(
                                  AppImages
                                      .atmCard),
                              fit: BoxFit
                                  .cover),
                        ),
                      )
                    : Container(
                        alignment:
                            Alignment.center,
                        height: 27.h,
                        width: 27.h,
                        decoration:
                            BoxDecoration(
                          shape:
                              BoxShape.circle,
                          color: const Color(
                              0xFF2e3333),
                        ),
                        child: Text(
                          "MK",
                          style: TextStyle(
                              fontSize: 9.sp,
                              fontWeight:
                                  FontWeight
                                      .w500,
                              color: Colors
                                  .white),
                        ),
                      ),
                SizedBox(
                    width: 7
                        .w), // Spacing between the circle and text
    
                // Title and Subtitle
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .start,
                    children: [
                      // Title
                      Text(
                        "PayPal",
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight:
                                FontWeight
                                    .bold,
                            color:
                                Colors.black),
                      ),
    
                      // Subtitle
                      Text(
                        "22 Nov",
                        style: TextStyle(
                          fontSize: 8.sp,
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
            mainAxisAlignment:
                MainAxisAlignment
                    .spaceBetween,
            children: [
              Text(
                'Correction',
                style: TextStyle(
                    fontSize: 7.sp,
                    fontWeight:
                        FontWeight.w600,
                    color: Colors.grey),
              ),
              Text(
                '-US\$40.19',
                style: TextStyle(
                    fontSize: 9.sp,
                    fontWeight:
                        FontWeight.w700,
                    color: Colors.black),
              ),
            ],
          )
        ],
      ),
    );
  }
}
