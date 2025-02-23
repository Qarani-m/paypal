// user_form_controller.dart
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paypal/src/features/auth/models/user_model.dart';

class UserFormController extends GetxController {
  final storage = GetStorage();
  final formKey = GlobalKey<FormState>();
  final ImagePicker picker = ImagePicker();

 final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final balanceController = TextEditingController();
  final currencyController = TextEditingController();
  final addressController = TextEditingController();


  final name = ''.obs;
  final phone = ''.obs;
  final balance = ''.obs;
  final currency = ''.obs;
  final email = ''.obs;
  final address = ''.obs;
  final imagePath = '-'.obs;
  final hasImage = false.obs;

  Future<void> pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath.value = image.path;
      hasImage.value = true;
    }
  }

  void saveUser(int fromWhere) {
    if (formKey.currentState!.validate()) {
      final user = UserModel(
          name: name.value,
          phone: phone.value,
          email: email.value,
          balance: balance.value,
          currency: currency.value.toUpperCase(),
          address: address.value,
          imagePath: imagePath.value,
          hasImage: hasImage.value);

      storage.write('user_data', user.toJson());





      Get.offNamed('/home');
    }
  }


void updateTheUserForm(){

}

@override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
   await  fillInFilesa();
  }





Future<void> fillInFilesa() async {
  // Define default values
  final Map<String, dynamic> defaultValues = {
    'name': '',
    'phone': '',
    'balance': '0.00',  // Default balance as zero
    'currency': 'USD',  // Default currency
    'email': '',
    'address': ''
  };

  // Read and merge with defaults
  Map<String, dynamic> userData = Map<String, dynamic>.from(defaultValues);
  Map<String, dynamic>? storedData = await storage.read('user_data');
  
  if (storedData != null) {
    userData.addAll(storedData);
  }

  // Ensure all values are valid (not null)
  userData.forEach((key, value) {
    if (value == null) {
      userData[key] = defaultValues[key];
    }
  });

  // Save the initialized userData
  await storage.write('user_data', userData);

  // Fill in the controllers
  nameController.text = userData['name'];
  phoneController.text = userData['phone'];
  balanceController.text = userData['balance'];
  currencyController.text = userData['currency'];
  emailController.text = userData['email'];
  addressController.text = userData['address'];

  print('Initialized User Data: $userData');
}
}

class UserFormPage extends GetView<UserFormController> {
  @override
  Widget build(BuildContext context) {
    controller.fillInFilesa();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Create Profile', style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10.sp),), centerTitle: true,),
      body: Form(
        key: controller.formKey,
        child: ListView(
          padding: EdgeInsets.all(16.w),
          children: [
            _buildProfileImagePicker(),
            SizedBox(height: 20.h),
            _buildTextField(
              controller:controller.nameController,
              label: 'Name',
              onChanged: (v) => controller.name.value = v,
            ),
            _buildTextField(
              controller:controller.phoneController,

              label: 'Phone',
              keyboardType: TextInputType.phone,
              onChanged: (v) => controller.phone.value = v,
            ),
            _buildTextField(
              label: 'Email',
              controller:controller.emailController,

              keyboardType: TextInputType.emailAddress,
              onChanged: (v) => controller.email.value = v,
            ),
            _buildTextField(
              controller:controller.balanceController,

              label: 'Balance',
              keyboardType: TextInputType.number,
              onChanged: (v) => controller.balance.value = v,
            ),
            _buildTextField(
              label: 'Currency',
              controller:controller.currencyController,

              onChanged: (v) =>
                  controller.currency.value = v, // Note: This seems incorrect
            ),
            _buildTextField(
              controller:controller.addressController,

              label: 'Address',
              onChanged: (v) => controller.address.value = v,
            ),
            SizedBox(height: 20.h),
            _buildSaveButton(),
          ],
        ),
      ),
    );
  }

Widget _buildProfileImagePicker() {
  return Obx(() => GestureDetector(
        onTap: controller.pickImage,
        child: Container(
          width: 120.w,
          height: 120.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: const Color(0xffffffff),
                blurRadius: 8,
                offset: Offset(2, 4),
              )
            ],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: 60.r,
                backgroundColor: Colors.grey.shade200,
                backgroundImage: controller.hasImage.value
                    ? FileImage(File(controller.imagePath.value))
                    : null,
              ),
              if (!controller.hasImage.value)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add_a_photo, size: 30.sp, color: Colors.grey.shade700),
                    SizedBox(height: 4.h),
                    Text("Upload", style: TextStyle(color: Colors.grey.shade700, fontSize: 12.sp))
                  ],
                ),
            ],
          ),
        ),
      ));
}


  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType keyboardType = TextInputType.text,
    required void Function(String) onChanged,
  }) {
    return Padding(
  padding: EdgeInsets.only(bottom: 12.h),
  child: TextFormField(
    controller: controller,
    style: TextStyle(
      fontWeight: FontWeight.w500,
      color: Colors.black87,
      fontSize: 12.sp,
    ),
    keyboardType: keyboardType,
    onChanged: onChanged,
    validator: (v) => v!.isEmpty ? 'Required' : null,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      labelText: label,
      labelStyle: TextStyle(color: Colors.grey.shade700, fontSize: 11.sp),
      hintText: "Enter $label",
      hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 11.sp),
      contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: Colors.grey.shade300, width: 1.2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: Colors.grey.shade300, width: 1.2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: Colors.blue.shade400, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: Colors.redAccent, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: Colors.redAccent, width: 1.5),
      ),
      prefixIcon: Icon(Icons.edit, color: Colors.grey.shade500),
      suffixIcon: GestureDetector(
        onTap: () => controller.clear(),
        child: Icon(Icons.clear, color: Colors.grey.shade500, size: 18.sp),
      ),
    ),
  ),
)
;
  }

  Widget _buildSaveButton() {


  return SizedBox(
    width: double.infinity,
    height: 44.h,
    child: ElevatedButton(
      onPressed:()=> controller.saveUser(0),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue.shade600,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        elevation: 4,
        shadowColor: Colors.blueAccent.withOpacity(0.4),
      ),
      child: Text(
        "Save Profile",
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
    ),
  );












    // return ElevatedButton(
    //   onPressed: controller.saveUser,
    //   style: ElevatedButton.styleFrom(
    //     minimumSize: Size(double.infinity, 50.h),
    //   ),
    //   child: Text('Save Profile'),
    // );
  }
}
