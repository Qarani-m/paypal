import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:paypal/src/constants/images.dart';
import 'package:paypal/src/features/transactions/screens/show_history.dart';
import 'package:paypal/src/features/transactions/screens/show_story.dart';

class SendToIndividual extends StatelessWidget {
  const SendToIndividual({super.key});
  @override
  Widget build(BuildContext context) {
    List<String> howCanWeHelp = [
      'Request a refund',
      'Get answers',
      'Report problem',
      'Contact Samuel Akoli'
    ];
    List<String> howCanWeHelpImages = [
      AppImages.bank,
      AppImages.bank,
      AppImages.bank,
      AppImages.bank,
    ];

    String amount = '40.34';
    String reciepient = 'Samuel Akoli';
    String date = 'Nov 22';
    String time = '05:23 am';
    String transactionId = '05:23 am';
    bool isPaymentCompleted = false;
    String address = 'Michael Bay\nNairobi\nKamakis\nNairobi 01000\nKenya';

TextStyle sameTextStyle = Theme.of(context).textTheme.bodySmall!.copyWith(
         fontSize: 8.sp,
         fontWeight: FontWeight.w500,
         color: Colors.black.withOpacity(1)
       );



    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Money sent",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 9.sp,
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
                      Container(
                        height: 25.h,
                        width: 25.h,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            reciepient,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontSize: 7.5.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black.withOpacity(1)),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            "$date,$time",
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
                          GestureDetector(
                            onTap: ()=>Get.to(ShowHistory()),
                            child: Text(
                              "Show history",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.blue,
                                      fontSize: 6.5.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.blue.withOpacity(1)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    "+US\$$amount",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 47, 117, 49)
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
                      "Dj fresh",
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
                      onTap: (){
Get.to(ShowStory());
                      },
                      child: Text(
                        "Show story",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blue,
                            fontSize: 6.5.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.blue.withOpacity(1)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height:11.h,
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
              padding: EdgeInsets.only(right: 70.w),
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
                        "Send again",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 7.sp,
                            fontWeight: FontWeight.w200,
                            color: Colors.black.withOpacity(1)),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20.w,
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
                          fontSize: 7.sp,
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
                            fontSize: 7.sp,
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
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
 mainAxisAlignment: MainAxisAlignment.spaceBetween,
 children: [
   Expanded(
     child: Center(
       child: Text(
         'Payment info',
         style: TextStyle(
           color: Colors.black,
           fontSize: 8.sp,
           fontWeight: FontWeight.w400
         ),
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







          ),
       isPaymentCompleted?   Align(
          alignment: Alignment.centerLeft,
            child: Container(
              // margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.5.h),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.check_circle_outline, color: Colors.white, size: 10.h),
                  SizedBox(width: 4),
                  Text('Completed', style: TextStyle(fontSize: 7.sp,color: Colors.white)),
                ],
              ),
            ),
          ): Align(
          alignment: Alignment.centerLeft,
            child: Container(
              // margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.5.h),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.priority_high_rounded, color: Colors.white, size: 10.h),
                  SizedBox(width: 4),
                  Text('Inprogress', style: TextStyle(fontSize: 7.sp,color: Colors.white)),
                ],
              ),
            ),
          ),


   SizedBox(height: 10.h),



          Column(
 crossAxisAlignment: CrossAxisAlignment.start,
 children: [
   Row(
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
     children: [
       Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text('From', style: sameTextStyle),
           SizedBox(height: 6.h,),
           Text('PayPal balance', style: sameTextStyle),
            
         ],
       ),
       Text('US\$16', style:sameTextStyle),
     ],
   ),
   SizedBox(height: 17.h),
 ],
),













          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Details', style: sameTextStyle),
              SizedBox(height: 17.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Amount',style: sameTextStyle,) ,Text('US\$${amount}',style: sameTextStyle,)],
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Total', style: sameTextStyle.copyWith(
                  fontWeight: FontWeight.w800
                ),), Text('US\$${amount}', style: sameTextStyle.copyWith(
                  fontWeight: FontWeight.w800
                ),)],
              ),
            ],
          ),
          SizedBox(height: 17.h,),
         Column(
 crossAxisAlignment: CrossAxisAlignment.start,
 children: [
   Row(
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
     children: [
       Column(
         crossAxisAlignment: CrossAxisAlignment.start, 
         children: [
           Text('Transaction ID', style: sameTextStyle),
   SizedBox(height: 8.h),

           Text(transactionId, style: sameTextStyle),
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
                        "Show payment info",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 6.5.sp,
                            fontWeight: FontWeight.w800,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blue,
                            color: Colors.blue.withOpacity(1)),
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
              child: Column(children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Ship to",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 7.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(1)),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    address,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 7.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(1)),
                  ),
                ),
              ]),
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
                          fontSize: 7.sp,
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
                            4,
                            (index) => Padding(
                                  padding: EdgeInsets.only(
                                      bottom: index == 3 ? 15.h : 30.h),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                          howCanWeHelpImages[index]),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Text(
                                        howCanWeHelp[index],
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                fontSize: 6.5.sp,
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.w),
              child: Text(
                "<h6 if you can\'t work things out with $reciepient, you can report aproblem to us by Jun 24 2025. You may be eligible for <a id=\"open_buyer_protection_link\"> Buyer protection</a></h6>",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 6.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(1)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
