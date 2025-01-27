import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paypal/src/features/home/controllers/homepage_controller.dart';
import 'package:paypal/src/features/home/widgets/homepage_buttons.dart';
import 'package:paypal/src/features/home/widgets/homepage_widgets.dart';

class Homepage extends GetView<HomepageController> {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> internationally = [
      'Direct to bank',
      'Cash Pick-up',
      'Mobile\nmoney',
      'Reload\nphones'
    ];
    return Scaffold(
      backgroundColor: Color(0xFFebedf3),
      body: Column(
        children: [
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await controller.loadRecentTransactions();
              },
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Container(
                  padding: EdgeInsets.only(left: 13.w, right: 13.w, top: 30.h),
                  color: Color(0xFFeff2f9),
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      SettingAndProfileMenu(),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          PayPalBalance(
                              balance: controller.userDetails.balance,
                              currency: controller.userDetails.currency),
                          SizedBox(
                            width: 40.w,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 10.w, right: 25.w, top: 8.h, bottom: 8.h),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6.r)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Pools",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 9.sp)),
                                    Text(
                                        "Track money with friendsfor\ngifts, trips, and more",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 9.sp)),
                                  ],
                                ),
                                SizedBox(
                                  height: 39.h,
                                ),
                                Text("Create a pool",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 9.sp)),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Send again',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w700,
                                    )),
                      ),
                      SizedBox(height: 13.h),
                      Container(
                        padding: EdgeInsets.only(left: 8.w),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 40.h,
                                  width: 40.h,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle),
                                  alignment: Alignment.center,
                                  child: Center(
                                    child: Text('SO',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              color: Colors.white,
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.w400,
                                            )),
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                Text('Sharon Ogeto',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          fontSize: 8.sp,
                                          fontWeight: FontWeight.w400,
                                        )),
                              ],
                            ),
                            SizedBox(
                              width: 35.w,
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 40.h,
                                  width: 40.h,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle),
                                  alignment: Alignment.center,
                                  child: Center(
                                    child: Icon(
                                      Icons.search,
                                      size: 16.h,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                Text('Search',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          fontSize: 8.sp,
                                          fontWeight: FontWeight.w400,
                                        )),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 25.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Send money internationally',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w700,
                                    )),
                      ),
                      SizedBox(height: 12.h),
                      // PayFromYourPhone(),
                      Row(
                        children: List.generate(
                            4,
                            (index) => Row(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          height: 40.h,
                                          width: 40.h,
                                          decoration: BoxDecoration(
                                              color: Colors.blue,
                                              shape: BoxShape.circle),
                                        ),
                                        SizedBox(height: 5.h),
                                        Container(
                                          height: 20.h,
                                          alignment: Alignment.topCenter,
                                          child: Text(
                                              textAlign: TextAlign.start,
                                              internationally[index],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.copyWith(
                                                    fontSize: 8.sp,
                                                    fontWeight: FontWeight.w400,
                                                  )),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 15.w,
                                    )
                                  ],
                                )),
                      ),
                      SizedBox(height: 12.h),
                      GetX<HomepageController>(builder: (controller) {
                        // print(controller.recentTransactions[0]);
                        return Column(
                          children: List.generate(
                            controller.recentTransactions.length,
                            (index) => PaymentContainer(
                                transaction:
                                    controller.recentTransactions[index],
                                id: controller.recentTransactions[index].id,
                                hasImage: controller
                                    .recentTransactions[index].hasProfilePic,
                                date: controller.recentTransactions[index].date,
                                index: index,
                                name: controller.recentTransactions[index].name,
                                amount:
                                    '${controller.recentTransactions[index].amount} ${controller.recentTransactions[index].currency}',
                                isRecieved:
                                    controller.recentTransactions[index].type,
                                showDetails: controller
                                        .recentTransactions[index]
                                        .message
                                        .length >
                                    0,
                                message: controller
                                    .recentTransactions[index].message,
                                imagePath: controller
                                    .recentTransactions[index].imagePath,
                                homepageController: controller,
                                category:
                                    '${controller.recentTransactions[index].type},${controller.recentTransactions[index].direction}'),
                          ),
                        );
                      }),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.r),
                              bottomRight: Radius.circular(10.r),
                            )),
                        padding: EdgeInsets.symmetric(vertical: 5.h),
                        alignment: Alignment.center,
                        child: Text(
                          "See more",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  fontSize: 6.5.sp,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xFF0059b3).withOpacity(1)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          HomepageButtonContainer(
            textLeft: "Send",
            textRight: "Request",
          )
        ],
      ),
    );
  }
}
