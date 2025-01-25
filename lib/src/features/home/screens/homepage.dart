import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paypal/src/constants/images.dart';
import 'package:paypal/src/features/home/controllers/homepage_controller.dart';
import 'package:paypal/src/features/home/widgets/homepage_buttons.dart';
import 'package:paypal/src/features/home/widgets/homepage_widgets.dart';

class Homepage extends GetView<HomepageController> {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
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
                      PayPalBalance(),
                      SizedBox(height: 12.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Send Payments',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.w700,
                                    )),
                      ),
                      SizedBox(height: 6.h),
                      PayFromYourPhone(),
                      SizedBox(height: 12.h),
                      GetX<HomepageController>(
                        builder: (controller) {
                          
                          // print(controller.recentTransactions[0]);
                          return  Column(
                          children: List.generate(
                            controller.recentTransactions.length,
                            (index) => PaymentContainer(
                              id:controller.recentTransactions[index].id,
                              hasImage: controller.recentTransactions[index].hasProfilePic,
                              date: controller.recentTransactions[index].date,
                              index: index,
                              name: controller.recentTransactions[index].name,
                              amount:'${controller.recentTransactions[index].amount} ${controller.recentTransactions[index].currency}',
                              isRecieved: controller.recentTransactions[index].direction =='Individual',
                              showDetails: controller.recentTransactions[index].message.length>0,
                              message: controller.recentTransactions[index].message,
                              imagePath: controller.recentTransactions[index].imagePath,
                              homepageController: controller,
                            ),
                          ),
                        );}
                      ),
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
                                  color: Colors.blue.withOpacity(1)),
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
