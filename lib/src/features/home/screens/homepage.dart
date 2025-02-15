import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paypal/src/constants/images.dart';
import 'package:paypal/src/features/home/controllers/homepage_controller.dart';
import 'package:paypal/src/features/home/models/contacts_model.dart';
import 'package:paypal/src/features/home/widgets/homepage_buttons.dart';
import 'package:paypal/src/features/home/widgets/homepage_widgets.dart';
import 'package:paypal/src/features/payments/screens/add_payment.dart';
import 'package:paypal/src/features/wallet/screens/wallet_homepage.dart';

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

    List<String> helpingHand = [
      'Macmilllian cancer support',
      'CARE INTERNATIONAL UK',
      'Street child'
    ];

     SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Color of the status bar
        statusBarIconBrightness: Brightness.dark, // Icon brightness in the status bar
      ),
    );
    return Scaffold(
      backgroundColor: Color(0xFFebedf3),
      body: Column(
        children: [
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await controller.loadRecentTransactions();
                await controller.loadTopThreeContacts();
              },
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Container(
                  padding: EdgeInsets.only(left: 13.w, top: 30.h),
                  color: Color(0xFFeff2f9),
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      SettingAndProfileMenu(),
                      SizedBox(height: 20.h),
                      PaypalPools(controller: controller),
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
                            Obx(
                              () => Row(
                                children: List.generate(
                                  controller.contacts.length,
                                  (index) => Row(
                                    children: [
                                      SizedBox(width: index == 0 ? 0.w : 25.w),
                                      GestureDetector(
                                        onLongPress: () async {
                                          print('pressed');
                                          await controller.deleteContact(
                                              controller.contacts[index].id!);
                                          await controller
                                              .loadTopThreeContacts();
                                        },
                                        child: SendAgainContact(
                                            contact:
                                                controller.contacts[index]),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 35.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                final nameController = TextEditingController();
                                final imagePathRx = RxString('');

                                Get.bottomSheet(
                                  Container(
                                    padding: EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(20)),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextField(
                                          controller: nameController,
                                          decoration: InputDecoration(
                                            labelText: 'Name',
                                            border: OutlineInputBorder(),
                                            filled: true,
                                          ),
                                        ),
                                        SizedBox(height: 16),
                                        ElevatedButton.icon(
                                          onPressed: controller.pickImage,
                                          icon: Icon(Icons.image),
                                          label: Text('Select Image'),
                                          style: ElevatedButton.styleFrom(
                                            minimumSize:
                                                Size(double.infinity, 48),
                                          ),
                                        ),
                                        Obx(() => imagePathRx.value.isNotEmpty
                                            ? Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 8),
                                                child: Text(
                                                    'Selected: ${imagePathRx.value.split('/').last}'),
                                              )
                                            : SizedBox.shrink()),
                                        SizedBox(height: 16),
                                        ElevatedButton(
                                          onPressed: () async {
                                            if (nameController.text
                                                .trim()
                                                .isNotEmpty) {
                                              await controller.saveUser(
                                                  nameController.text,
                                                  imagePathRx.value.isNotEmpty,
                                                  imagePathRx.value.isEmpty
                                                      ? null
                                                      : imagePathRx.value);
                                              Get.back();
                                              Get.snackbar(
                                                'Success',
                                                'User saved successfully',
                                                snackPosition:
                                                    SnackPosition.BOTTOM,
                                              );
                                            } else {
                                              Get.snackbar(
                                                'Error',
                                                'Please enter a name',
                                                snackPosition:
                                                    SnackPosition.BOTTOM,
                                                backgroundColor:
                                                    Colors.red.withOpacity(0.1),
                                              );
                                            }
                                          },
                                          child: Text('Save'),
                                          style: ElevatedButton.styleFrom(
                                            minimumSize:
                                                Size(double.infinity, 48),
                                          ),
                                        ),
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                .viewInsets
                                                .bottom),
                                      ],
                                    ),
                                  ),
                                  isScrollControlled: true,
                                  enableDrag: true,
                                );
                              },
                              child: Column(
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
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/homepage/$index.png')),
                                              color: Colors.white,
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
                        return Padding(
                          padding: EdgeInsets.only(
                            right: 13.w,
                          ),
                          child: Column(
                            children: List.generate(
                              controller.recentTransactions.length,
                              (index) => PaymentContainer(
                                  transaction:
                                      controller.recentTransactions[index],
                                  id: controller.recentTransactions[index].id,
                                  hasImage: controller
                                      .recentTransactions[index].hasProfilePic,
                                  date:
                                      controller.recentTransactions[index].date,
                                  index: index,
                                  name:
                                      controller.recentTransactions[index].name,
                                  amount:
                                      '${controller.recentTransactions[index].amount} ${controller.recentTransactions[index].currency}',
                                  isreceived:
                                      controller.recentTransactions[index].type,
                                  showDetails: controller
                                      .recentTransactions[index]
                                      .message
                                      .isNotEmpty,
                                  message: controller
                                      .recentTransactions[index].message,
                                  imagePath: controller
                                      .recentTransactions[index].imagePath,
                                  homepageController: controller,
                                  category:
                                      '${controller.recentTransactions[index].type},${controller.recentTransactions[index].direction}'),
                            ),
                          ),
                        );
                      }),
                      Padding(
                        padding: EdgeInsets.only(
                          right: 13.w,
                        ),
                        child: GestureDetector(
                          onTap: () => Get.to(WalletHomepage(
                            initialTabIndex: 1,
                          )),
                          child: Container(
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
                                      fontSize: 8.5.sp,
                                      fontWeight: FontWeight.w900,
                                      color: Color(0xFF0059b3).withOpacity(1)),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 18.h),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Lend a helping hand',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w700,
                                    )),
                      ),

                      SizedBox(height: 7.h),

                      const SimpleSlider(),

                      SizedBox(height: 18.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SimpleSlider extends StatefulWidget {
  const SimpleSlider({Key? key}) : super(key: key);

  @override
  State<SimpleSlider> createState() => _SimpleSliderState();
}

class _SimpleSliderState extends State<SimpleSlider> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> helpingHand = [
      'Street Child',
      'CARE INTERNATIONAL UK',
      'Macmilllian cancer support',
    ];
    List<String> circles = [
      'assets/images/streetchild.png',
      'assets/images/care.png',
      AppImages.atmCard,
    ];

    List<Color> colors = [
      Color(0xFF761ad3),
      Colors.yellow,
      Colors.deepPurpleAccent
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          3,
          (index) => Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: Container(
              width: 250.w,
              height: 120.h,
              padding: EdgeInsets.only(
                top: 8.h,
                left: 8.w,
                bottom: 8.h,
                right: 90.w,
              ),
              decoration: index == 2
                  ? BoxDecoration(
                      color: Colors.amber,
                      image: DecorationImage(
                          image: AssetImage('assets/images/1.png'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10.r),
                    )
                  : BoxDecoration(
                      color: colors[index],
                      borderRadius: BorderRadius.circular(10.r),
                    ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  index == 2
                      ? SizedBox.shrink()
                      : Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            height: 30.h,
                            width: 30.h,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage(circles[index]),
                                    fit: BoxFit.contain)),
                          ),
                        ),
                  // SizedBox(height: 42.h),
                  index == 2
                      ? SizedBox.shrink()
                      : Text(
                          helpingHand[index],
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                fontSize: 13.sp,
                                color: index == 1 ? Colors.black : Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SendAgainContact extends StatelessWidget {
  const SendAgainContact({
    super.key,
    required this.contact,
  });

  final ContactModel contact;

  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40.h,
          width: 40.h,
          decoration: contact.hasImage
              ? BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(File(contact.imageUrl!)),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle)
              : BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
          alignment: Alignment.center,
          child: contact.hasImage
              ? SizedBox.shrink()
              : Center(
                  child: Text(
                      contact.name
                          .trim()
                          .split(' ')
                          .map((part) => part[0].toUpperCase())
                          .join(),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.white,
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w400,
                          )),
                ),
        ),
        SizedBox(height: 5.h),
        Text(contact.name,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w400,
                )),
      ],
    );
  }
}

class PaypalPools extends StatelessWidget {
  const PaypalPools({
    super.key,
    required this.controller,
  });

  final HomepageController controller;

  @override
  Widget build(BuildContext context) {
    final storage = GetStorage();
    if (storage.read('user_data') == null) {
      storage.write('user_data', {
        'name': '',
        'phone': '',
        'balance': '',
        'currency': '',
        'email': '',
        'address': ''
      });
    }
    Map<String, dynamic> userData = storage.read('user_data');

    // Get stored date and today's date
    // Map> userData = storage.read('user_data');

    return Row(
      children: [
        GestureDetector(
          onTap: () => Get.to(AddPayment()),
          child: PayPalBalance(
            balance: userData['balance'],
            currency: userData['currency'],
          ),
        ),
        SizedBox(
          width: 40.w,
        ),
        Container(
          padding:
              EdgeInsets.only(left: 10.w, right: 25.w, top: 8.h, bottom: 8.h),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(6.r)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Pools",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w400, fontSize: 9.sp)),
                  Text("Track money with friendsfor\ngifts, trips, and more",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 9.sp)),
                ],
              ),
              SizedBox(
                height: 39.h,
              ),
              Text("Create a pool",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                      fontSize: 9.sp)),
            ],
          ),
        )
      ],
    );
  }
}
