import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScanYourCard extends StatelessWidget {
  const ScanYourCard({super.key});

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
          "Link a card",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 8.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black.withOpacity(1)),
        ),
      ),
      body: Padding(
        padding:   EdgeInsets.only(bottom: 20.h),
        child: Column(
          
          children: [


Column(
  children: [


Container(
  width: double.maxFinite,
  height: 400.h,
  color: Colors.grey,
  alignment: Alignment.center,

  child: Container(
    height: 80.h,
    width: 300.w,
    padding: EdgeInsets.symmetric(vertical: 10.h),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.r)
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [



           Text(
                                            "Transfer money you recieve to your bank account",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                    fontSize: 7.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black
                                                        .withOpacity(1)),
                                          ),

SizedBox(height: 6.h,),


                                             Text(
                                            "Transfer money you recieve to your bank account",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                    fontSize: 6.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black
                                                        .withOpacity(1)),
                                          ),

SizedBox(height: 6.h,),

                                             Text(
                                            "Open settings",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                    fontSize: 6.sp,
                                                    color: Colors.blue,
                                                    fontWeight: FontWeight.w800,
                                                  decoration: TextDecoration.underline,
                                                      decorationColor: Colors.blue
                                                        .withOpacity(1)),
                                          ),

      ],
    ),
  ),
),

    SizedBox(height: 10.h,),
 Align(
                alignment: Alignment.center,
                 child: Text(
                                                "Hold your card infront of your phone",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall
                                                    ?.copyWith(
                                                        fontSize: 6.sp,
                                                        fontWeight: FontWeight.w400,
                                                        color: Colors.black
                                                            .withOpacity(1)),
                                              ),
               ),
  ],
)



,

            Spacer(),
        
        
        
               Align(
                alignment: Alignment.center,
                 child: Text(
                                                "Enter your card info instead",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall
                                                    ?.copyWith(
                                                      decoration: TextDecoration.underline,
                                                      decorationColor: Colors.blue,
                                                        fontSize: 7.sp,
                                                        fontWeight: FontWeight.w900,
                                                        color: Colors.blue
                                                            .withOpacity(1)),
                                              ),
               ),
        
          ],
        ),
      ),
    );
  }
}