import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paypal/src/constants/images.dart';
import 'package:flutter/material.dart';

class ShowHistory extends StatelessWidget {
  const ShowHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
                leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 12.sp), // Adjust size here
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          "History",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 8.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black.withOpacity(1)),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10.h, left: 0.w, right: 0.w),
        child: Column(
          children: [


Container(
  // alignment: Alignment.center,
width: 63.w,
  child: Stack(
 alignment: Alignment.centerRight,
 children: [
   Positioned(
   right: 29.w,
     top: 0, // Adjust this value to move up/down

     child: CircleAvatar(
       backgroundColor: const Color.fromARGB(255, 36, 125, 198),
       radius: 16.r,
       child:Text(
                            "SO",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontSize: 8.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white.withOpacity(1)),
                          ),
     ),
   ),
   CircleAvatar(
   radius: 16.r,
   
     backgroundColor: Colors.red,
      )
 ],
),
),









               SizedBox(
              height: 20.h,
            ),


             Text(
                                      "You & Samuel Akoli",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              fontSize: 6.5.sp,
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  Colors.black.withOpacity(1)),
                                    ),


            SizedBox(
              height: 10.h,
            ),
            Container(
              height: 2.5.h,
              width: double.maxFinite,
              color: Color(0xFFeff2f9).withOpacity(0.5),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OneAction(text: "Send money", icon: AppImages.backArrow),
                SizedBox(
                  width: 30.w,
                ),
                OneAction(text: "Message", icon: AppImages.backArrow),
                SizedBox(
                  width: 30.w,
                ),
                OneAction(text: "Request money", icon: AppImages.backArrow),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              height: 2.5.h,
              width: double.maxFinite,
              color: Color(0xFFeff2f9).withOpacity(0.5),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.w),
              child: Column(
                children: List.generate(
                    3,
                    (index) => Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Jan 1, 2025",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              fontSize: 7.sp,
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  Colors.black.withOpacity(1)),
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Text(
                                      "Money sent",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              fontSize: 6.5.sp,
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  Colors.black.withOpacity(1)),
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Text(
                                      "Fmaily",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              fontSize: 6.5.sp,
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  Colors.black.withOpacity(1)),
                                    ),
                                  ],
                                ),
                                Text(
                                  "-US40.54",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                          fontSize: 7.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black.withOpacity(1)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 17.h,
                            )
                          ],
                        )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OneAction extends StatelessWidget {
  const OneAction({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Color(0xFFeff2f9).withOpacity(0.4),
          radius: 17.r,
          child: SvgPicture.asset(icon),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 7.sp,
              fontWeight: FontWeight.w200,
              color: Colors.black.withOpacity(1)),
        ),
      ],
    );
  }
}
