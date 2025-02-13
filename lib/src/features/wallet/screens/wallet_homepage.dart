
// wallet_controller.dart
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paypal/src/constants/images.dart';
import 'package:paypal/src/features/home/controllers/homepage_controller.dart';
import 'package:paypal/src/features/home/models/nav_item.dart';
import 'package:paypal/src/features/home/screens/homepage.dart';
import 'package:paypal/src/features/home/widgets/bottom_appbar.dart';
import 'package:paypal/src/features/home/widgets/homepage_widgets.dart';
import 'package:paypal/src/features/payments/models/payment_model.dart';
import 'package:paypal/src/features/payments/screens/payments_homepgae.dart';
import 'package:paypal/src/features/wallet/controllers/wallet_controller.dart';
import 'package:paypal/src/features/wallet/widgets/custom_searchbar.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';
import 'package:paypal/src/utils/utilities.dart';

class WalletHomepage extends GetView<WalletController> {
  const WalletHomepage({super.key, this.initialTabIndex = 0});

  final int initialTabIndex;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (controller.tabController.index != initialTabIndex) {
        controller.tabController.animateTo(initialTabIndex);
      }
    });

    final List<NavItem> _navItems = [
      NavItem(
        label: 'Home',
        svgPath: 'assets/svg/house.svg',
        page: const Homepage(),
        // page: const Homepage1(),
      ),
      NavItem(
        label: 'Crypto',
        svgPath: 'assets/svg/bar-chart-line.svg',
        page: PaymentsHomepgae(),
      ),
      NavItem(
        label: 'Send/Request',
        svgPath: 'assets/svg/arrow-down-up.svg',
        page: PaymentsHomepgae(),
      ),
      NavItem(
        label: 'Wallet',
        svgPath: 'assets/svg/wallet.svg',
        page: const WalletHomepage(),
      ),
    ];
    controller.loadData();
    Map<String, String> nameAndSigns = {'GBP': '£', 'EUR': '€', 'USD': '\$'};

    return Scaffold(
      bottomNavigationBar: initialTabIndex == 0
          ? null
          : CustomBottomNavigationBar(
              items: _navItems,
              selectedColor: Colors.black,
              unselectedColor: Colors.grey,
              backgroundColor: Colors.white,
              height: 35.h,
            ),
      body: Padding(
        padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 60.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 200.w,
              // color: Colors.red,
              child: TabBar(
                controller: controller.tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black.withOpacity(0.4),
                indicatorColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                onTap: controller.changeMainTab,
                tabs: [
                  Tab(
                    child: Text(
                      'Wallet',
                      style: TextStyle(
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Rewards',
                      style: TextStyle(
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Activity',
                      style: TextStyle(
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: controller.tabController,
                children: [
                  // Wallet Tab Content
                  Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed('/paypal_balance'),
                        child: Obx(
                          () => Container(
                            padding: EdgeInsets.only(
                                left: 10.w,
                                right: 10.w,
                                top: 8.h,
                                bottom: 70.h),
                            height: 190.h,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.r)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                            height: 14.h,
                                            width: 14.h,
                                            AppImages.paypalLogo1),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        Text("PayPalbalance",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black
                                                        .withOpacity(1))),
                                      ],
                                    ),
                                    Text(
                                        "${nameAndSigns[controller.currency.value]}${AppUtilities().formatNumber(controller.amount.value)}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                fontSize: 9.sp,
                                                fontWeight: FontWeight.w900,
                                                color: Colors.black
                                                    .withOpacity(0.8))),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      "${nameAndSigns[controller.currency.value]}${AppUtilities().formatNumber(controller.amount.value)}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              fontSize: 24.sp,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.black
                                                  .withOpacity(0.9))),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Banks and cards',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black.withOpacity(1))),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Add new',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                          fontSize: 8.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black.withOpacity(1))),
                              Icon(Icons.arrow_forward_ios,
                                  size: 13.h,
                                  color: Colors.black.withOpacity(1))
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 18.h,
                      ),

                      // GestureDetector(
                      //   onTap: () => Get.toNamed("/card_main_page"),
                      //   child: Container(
                      //     padding: EdgeInsets.only(left: 15.w, bottom: 5.w),
                      //     height: 180.h,
                      //     width: double.maxFinite,
                      //     decoration: BoxDecoration(
                      //         image: DecorationImage(
                      //             fit: BoxFit.cover,
                      //             image: AssetImage(AppImages.atmCard)),
                      //         color: Colors.white,
                      //         borderRadius: BorderRadius.circular(5.r)),
                      //     alignment: Alignment.bottomLeft,
                      //     child: Row(
                      //       children: [
                      //         Text('⋅⋅',
                      //             style: Theme.of(context)
                      //                 .textTheme
                      //                 .bodySmall
                      //                 ?.copyWith(
                      //                     fontSize: 19.sp,
                      //                     fontWeight: FontWeight.w900,
                      //                     color: Color(0xFF9ee86f))),
                      //         Text(' 6335',
                      //             style: Theme.of(context)
                      //                 .textTheme
                      //                 .bodySmall
                      //                 ?.copyWith(
                      //                     fontSize: 8.sp,
                      //                     fontWeight: FontWeight.w900,
                      //                     color: Color(0xFF9ee86f))),
                      //       ],
                      //     ),
                      //   ),
                      // ),

                      Container(
                        padding: EdgeInsets.only(
                            left: 10.w, right: 10.w, top: 10.h, bottom: 20.h),
                        height: 105.h,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.r)),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Add bank accounts and cards',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.black.withOpacity(1)),
                                ),
                                SizedBox(height: 3.h,),
                                Text(
                                  'Send, shop and pay without sharing bank\naccount or card detalls with stores or\nsellers.',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                          fontSize: 9.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black.withOpacity(1)),
                                )
                              ],
                            ),
                            SizedBox(width: 30.w,),
                            Container(
                              height: 60.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/cards.png'))),
                            )
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 18.h,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Preferences',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black.withOpacity(1)),
                          )),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        padding: EdgeInsets.only(
                            left: 15.w, top: 10.h, bottom: 10.h),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () =>
                                  Get.toNamed('/preferences', arguments: ''),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 20.h,
                                    width: 20.h,
                                    decoration: BoxDecoration(
                                        // color: Colors.red,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/lock.png'))),
                                  ),
                                  SizedBox(
                                    width: 7.w,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Online purchases',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                fontSize: 10.sp,
                                                color: Colors.black),
                                      ),
                                      Text(
                                        'PayPal Online balance',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                fontSize: 8.sp,
                                                fontWeight: FontWeight.w300,
                                                color: Colors.black87),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            GestureDetector(
                              onTap: () => Get.toNamed('/preferences',
                                  arguments: 'Automatic payments'),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 20.h,
                                    width: 20.h,
                                    decoration: BoxDecoration(
                                        // color: Colors.red,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/org.png'))),
                                  ),
                                  SizedBox(
                                    width: 7.w,
                                  ),
                                  Text(
                                    'In-person & QR code purchases',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            fontSize: 10.sp,
                                            color: Colors.black),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),

                  Container(),

                  // Activity Tab Content
                  Center(
                    child: Obx(() => Column(
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
// In your page/widget:
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 9.w, bottom: 3.h, top: 3.h),
                                    height: 20.h,
                                    decoration: BoxDecoration(
                                      color: const Color(
                                          0xFFffffff), // Light grey/blue background
                                      borderRadius: BorderRadius.circular(15.r),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.search,
                                          color: Colors.grey[600],
                                          size: 14.w,
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Text('Search by name or email',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  fontSize: 8.sp,
                                                  fontWeight: FontWeight.w200,
                                                )),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 6.w,
                                ),
                                Icon(
                                  Icons.tune,
                                  size: 13.w,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                SizedBox(
                                  width: 6.w,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),

                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Completed',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        fontSize: 9.sp,
                                        fontWeight: FontWeight.w400,
                                      )),
                            ),

                            SizedBox(
                              height: 10.h,
                            ),

                            GetX<HomepageController>(builder: (controller) {
                              // First, group transactions by date
                              final groupedTransactions =
                                  groupTransactionsByDate(
                                      controller.recentTransactions);

                              return Padding(
                                padding: EdgeInsets.only(right: 13.w),
                                child: Column(
                                  children:
                                      groupedTransactions.entries.map((entry) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Date header
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            formatDateHeader(entry.key),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  fontSize: 8.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                          ),
                                        ),

                                        SizedBox(height: 3.h),

                                        // Transactions for this date
                                        ...entry.value
                                            .map((transaction) =>
                                                PaymentContainer(
                                                  transaction: transaction,
                                                  id: transaction.id,
                                                  hasImage:
                                                      transaction.hasProfilePic,
                                                  date: transaction.date,
                                                  index: controller
                                                      .recentTransactions
                                                      .indexOf(transaction),
                                                  name: transaction.name,
                                                  amount:
                                                      '${transaction.amount} ${transaction.currency}',
                                                  isreceived: transaction.type,
                                                  showDetails: transaction
                                                          .message.length >
                                                      0,
                                                  message: transaction.message,
                                                  imagePath:
                                                      transaction.imagePath,
                                                  homepageController:
                                                      controller,
                                                  category:
                                                      '${transaction.type},${transaction.direction}',
                                                ))
                                            .toList(),

                                        SizedBox(
                                            height: 10
                                                .h), // Add spacing between date groups
                                      ],
                                    );
                                  }).toList(),
                                ),
                              );
                            }),

                            Text(
                              '${controller.mainTabIndex}',
                              style: TextStyle(fontSize: 0.1),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Map<DateTime, List<PaymentModel>> groupTransactionsByDate(
      List<PaymentModel> transactions) {
    // Sort transactions by date first (newest to oldest)
    final sortedTransactions = List<PaymentModel>.from(transactions)
      ..sort((a, b) {
        final dateA = DateTime.parse(a.date);
        final dateB = DateTime.parse(b.date);
        return dateB.compareTo(dateA);
      });

    // Group by date
    return groupBy(sortedTransactions, (PaymentModel t) {
      final date = DateTime.parse(t.date);
      return DateTime(date.year, date.month, date.day);
    });
  }

  String formatDateHeader(DateTime date) {
    final now = DateTime.now();
    final yesterday = DateTime.now().subtract(const Duration(days: 1));

    // Check if it's today
    if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day) {
      return 'Today';
    }
    // Check if it's yesterday
    else if (date.year == yesterday.year &&
        date.month == yesterday.month &&
        date.day == yesterday.day) {
      return 'Yesterday';
    }
    // If it's this year, show month and day
    else if (date.year == now.year) {
      return DateFormat('MMM d').format(date);
    }
    // If it's a different year, show month, day and year
    else {
      return DateFormat('MMM d, y').format(date);
    }
  }
}

class OneActivityActivityTab extends StatelessWidget {
  const OneActivityActivityTab(
      {super.key,
      required this.hasImage,
      required this.index,
      this.showExtra = false,
      required this.length});

  final bool hasImage;
  final int index;
  final int length;
  final bool showExtra;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          // Top item: round top corners
          topLeft: index == 0 ? Radius.circular(5.r) : Radius.zero,
          topRight: index == 0 ? Radius.circular(5.r) : Radius.zero,

          // Bottom item: round bottom corners
          bottomLeft: index == length - 1 ? Radius.circular(5.r) : Radius.zero,
          bottomRight: index == length - 1 ? Radius.circular(5.r) : Radius.zero,
        ),
        border: index != length - 1
            ? Border(
                bottom: BorderSide(
                  color: Colors.grey.withOpacity(0.2),
                  width: 1,
                ),
              )
            : null,
      ),
      padding:
          EdgeInsets.only(top: 10.h, bottom: 15.h, left: 15.w, right: 15.w),
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
                          image: DecorationImage(
                              image: AssetImage(AppImages.atmCard),
                              fit: BoxFit.cover),
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
                          "MK",
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
                        "PayPal",
                        style: TextStyle(
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Correction',
                style: TextStyle(
                    fontSize: 7.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey),
              ),
              Text(
                '-US\$40.19',
                style: TextStyle(
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
            ],
          ),
          showExtra
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '"Family"',
                        style: TextStyle(
                            fontSize: 7.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 3.h, horizontal: 8.w),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20.r)),
                      child: Text(
                        'Add tracking',
                        style: TextStyle(
                            fontSize: 7.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    )
                  ],
                )
              : Center()
        ],
      ),
    );
  }
}



