import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paypal/src/utils/services/api_service.dart';

class NormalLogin extends StatelessWidget {
  const NormalLogin({super.key});

  @override
  Widget build(BuildContext context) {
    UserService().checkAppStatus();
 
    return Scaffold(
      
    );
  }
}