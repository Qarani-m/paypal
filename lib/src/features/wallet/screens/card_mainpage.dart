import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:paypal/src/constants/images.dart';
import 'package:paypal/src/features/wallet/controllers/wallet_controller.dart';

class CardMainpage extends GetView<WalletController> {
  const CardMainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 40.h, left: 10.w, right: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                    onTap: () => Get.back(), child: Icon(Icons.arrow_back)),
                Expanded(
                  child: Center(
                      child: Container(
                    // color: Colors.red,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Prepaid ',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w400,
                                    )),
                        Text('⋅⋅',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 23.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    )),
                        Text('6335',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w400,
                                    )),
                      ],
                    ),
                  )),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              padding: EdgeInsets.only(left: 15.w, bottom: 5.w),
              height: 180.h,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(AppImages.atmCard)),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r)),
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  Text('⋅⋅',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF9ffffff))),
                  Text(' 6335',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF9ffffff))),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Name',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 9.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withOpacity(1)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Your Bank prepaid ',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w400,
                        )),
                Text('⋅⋅',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 23.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        )),
                Text('6335',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w400,
                        )),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Text('Give it a nickname',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 9.sp,
                      color: Color(0xFF0166f6),
                      fontWeight: FontWeight.w600,
                    )),
            SizedBox(
              height: 20.h,
            ),
            Text('Expires on',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w400,
                    )),
            Text('06/25',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w400,
                    )),
            SizedBox(
              height: 20.h,
            ),
            Text('Billing address',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w400,
                    )),
            SizedBox(
              height: 5.h,
            ),
            Text('12345 Broadway street',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w400,
                    )),
            Text('10205 Las vegas',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w400,
                    )),
            Text('Nevada, USA',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w400,
                    )),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                SvgPicture.asset(
                  AppImages.editCard,
                  color: Color(0xFF0166f6),
                ),
                SizedBox(
                  width: 6.w,
                ),
                Text('Edit',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0166f6),
                        )),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: [
                SvgPicture.asset(
                  AppImages.removeCard,
                  color: Color(0xFF0166f6),
                ),
                SizedBox(
                  width: 6.w,
                ),
                Text('Remove',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0166f6),
                        )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
