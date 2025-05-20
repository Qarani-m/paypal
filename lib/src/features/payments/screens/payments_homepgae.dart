import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:paypal/src/constants/images.dart';
import 'package:paypal/src/features/payments/controllers/payments_controller.dart';
import 'package:paypal/src/features/wallet/controllers/wallet_controller.dart';

class PaymentsHomepgae extends GetView<PaymentsController> {
  PaymentsHomepgae({super.key, this.index=0});


  final int index;

  @override
  Widget build(BuildContext context) {
     WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.tabController.index = index;
    });
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 35.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Payments",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black.withOpacity(1))),
            SizedBox(
              height: 14.h,
            ),
            Container(
              width: 170.w,
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
                      'Send',
                      style: TextStyle(
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Biils',
                      style: TextStyle(
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Request',
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
                child:
                    TabBarView(controller: controller.tabController, children: [
              SendTab(),
              BiilsTab(),
              RequestsTab(controller:controller),
              // Column(),
              // Column()
            ]))
          ],
        ),
      ),
    );
  }
}

class RequestsTab extends StatelessWidget {
  const RequestsTab({
    super.key, required this.controller,
  });

  final PaymentsController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15.h,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text('Request from someone new',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w700,
                  )),
        ),
        SizedBox(
          height: 7.h,
        ),
        Container(
          padding: EdgeInsets.only(left: 9.w, bottom: 3.h, top: 3.h),
          height: 20.h,
          decoration: BoxDecoration(
            color: const Color(0xFFffffff), // Light grey/blue background
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
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w200,
                      )),
            ],
          ),
        ),
        SizedBox(
          height: 7.h,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text('Top contacts',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w700,
                  )),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          padding:
              EdgeInsets.only(top: 15.h, bottom: 15.h, left: 20.w, right: 20.w),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15.r)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    3,
                    (index) => Container(
                          width: 65.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 28.r,
                                child: Text(
                                  
                                  "${controller.topContacts[index][0][0].toUpperCase()}${controller.topContacts[index][1][0].toUpperCase()}"
                                  ,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color: Colors.white,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        )),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Text(controller.topContacts[index],
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        fontSize: 9.sp,
                                        fontWeight: FontWeight.w400,
                                      )),
                            ],
                          ),
                        )),
              )
,
              
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text('More ways to get paid',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w700,
                  )),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          child: Row(
            children: [
// Image(image: AssetImage(),),
              SvgPicture.asset(
                AppImages.onlinePurchases,
                height: 12.h,
              ),

              SizedBox(
                width: 15.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Send an invoice',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w700,
                          )),
                  Text('Customize,track, and send invoices',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w200,
                          )),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class BiilsTab extends StatelessWidget {
  const BiilsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15.h,
        ),
        Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 18.r,
                    backgroundColor: Color(0xFFf1f3f8),
                    child: Container(
                      height: 20.h,
                      width: 20.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    'GitHub, Inc',
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Direct debit',
                    style: TextStyle(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  Text(
                    'Paid on May 1 , 2024',
                    style: TextStyle(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black.withOpacity(0.5)),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class SendTab extends StatelessWidget {
  const SendTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15.h,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text('Send to someone new',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w400,
                  )),
        ),
        SizedBox(
          height: 7.h,
        ),
        Container(
          padding: EdgeInsets.only(left: 9.w, bottom: 3.h, top: 3.h),
          height: 20.h,
          decoration: BoxDecoration(
            color: const Color(0xFFffffff), // Light grey/blue background
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
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w200,
                      )),
            ],
          ),
        ),
        SizedBox(
          height: 7.h,
        ),
        Container(
          height: 130.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.white,
          ),
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image(
                  image: AssetImage(AppImages.paypalLogo1),
                  height: 30.h,
                  width: 30.w,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Find people to start sending money',
                style: TextStyle(
                    fontSize: 7.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
                decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20.r)),
                child: Text(
                  'Get started',
                  style: TextStyle(
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
