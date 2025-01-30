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

 final name = ''.obs;
 final phone = ''.obs;
 final balance = ''.obs;
 final currency = ''.obs;
 final email = ''.obs;
 final address = ''.obs;
 final imagePath = ''.obs;
 final hasImage = false.obs;

 Future<void> pickImage() async {
   final XFile? image = await picker.pickImage(source: ImageSource.gallery);
   if (image != null) {
     imagePath.value = image.path;
     hasImage.value = true;
   }
 }

 void saveUser() {
   if (formKey.currentState!.validate()) {
     final user = UserModel(
       name: name.value,
       phone: phone.value,
       email: email.value,
       balance: balance.value,
       currency: currency.value.toUpperCase(),
       address: address.value,
       imagePath: imagePath.value,
       hasImage: hasImage.value
     );

     print(user);
     storage.write('user_data', user.toJson());
     Get.offNamed('/home');
   }
 }
} 

 

class UserFormPage extends GetView<UserFormController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Profile')),
      body: Form(
        key: controller.formKey,
        child: ListView(
          padding: EdgeInsets.all(16.w),
          children: [
            _buildProfileImagePicker(),
            SizedBox(height: 20.h),
            _buildTextField(
              label: 'Name',
              onChanged: (v) => controller.name.value = v,
            ),
            _buildTextField(
              label: 'Phone',
              keyboardType: TextInputType.phone,
              onChanged: (v) => controller.phone.value = v,
            ),
            _buildTextField(
              label: 'Email',
              keyboardType: TextInputType.emailAddress,
              onChanged: (v) => controller.email.value = v,
            ),
            _buildTextField(
              label: 'Balance',
              keyboardType: TextInputType.number,
              onChanged: (v) => controller.balance.value = v,
            ),
            _buildTextField(
              label: 'Currency',
              onChanged: (v) => controller.currency.value = v, // Note: This seems incorrect
            ),
            _buildTextField(
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
      child: CircleAvatar(
        radius: 50.r,
        backgroundImage: controller.hasImage.value 
          ? FileImage(File(controller.imagePath.value))
          : null,
        child: !controller.hasImage.value 
          ? Icon(Icons.add_a_photo) 
          : null,
      ),
    ));
  }

  Widget _buildTextField({
    required String label,
    TextInputType keyboardType = TextInputType.text,
    required void Function(String) onChanged,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: TextFormField(
        style: TextStyle(
          fontWeight: FontWeight.w300,
                      color: Colors.black,

          fontSize: 8.sp
        ),
        keyboardType: keyboardType,
        onChanged: onChanged,
        validator: (v) => v!.isEmpty ? 'Required' : null,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
      onPressed: controller.saveUser,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50.h),
      ),
      child: Text('Save Profile'),
    );
  }
}