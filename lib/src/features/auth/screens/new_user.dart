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
       address: address.value,
       imagePath: imagePath.value,
       hasImage: hasImage.value
     );
     storage.write('user', user.toJson());
     Get.offNamed('/home');
   }
 }
}

// user_form_page.dart
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
           Obx(() => GestureDetector(
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
           )),
           
           SizedBox(height: 20.h),
           
           TextFormField(
             onChanged: (v) => controller.name.value = v,
             validator: (v) => v!.isEmpty ? 'Required' : null,
             decoration: InputDecoration(
               labelText: 'Name',
               border: OutlineInputBorder(),
             ),
           ),
           
           SizedBox(height: 12.h),
           
           TextFormField(
             onChanged: (v) => controller.phone.value = v,
             validator: (v) => v!.isEmpty ? 'Required' : null,
             decoration: InputDecoration(
               labelText: 'Phone',
               border: OutlineInputBorder(),
             ),
           ),
           
           SizedBox(height: 12.h),
           
           TextFormField(
             onChanged: (v) => controller.email.value = v,
             validator: (v) => v!.isEmpty ? 'Required' : null,
             decoration: InputDecoration(
               labelText: 'Email',
               border: OutlineInputBorder(),
             ),
           ),
           
           SizedBox(height: 12.h),
           
           TextFormField(
             onChanged: (v) => controller.address.value = v,
             validator: (v) => v!.isEmpty ? 'Required' : null,
             decoration: InputDecoration(
               labelText: 'Address',
               border: OutlineInputBorder(),
             ),
           ),
           
           SizedBox(height: 20.h),
           
           ElevatedButton(
             onPressed: controller.saveUser,
             child: Text('Save Profile'),
             style: ElevatedButton.styleFrom(
               minimumSize: Size(double.infinity, 50.h),
             ),
           )
         ],
       ),
     ),
   );
 }
}