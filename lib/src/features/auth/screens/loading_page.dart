import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paypal/src/utils/services/api_service.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPage();
}

class _LoadingPage extends State<LoadingPage> {
  final UserService _appService = UserService();

  @override
  void initState() {
    super.initState();
    _checkAppStatus();
  }

  Future<void> _checkAppStatus() async {
    bool? isAppAllowed = await _appService.checkAppStatus();

    if (isAppAllowed == true) {

        Get.offNamed('/home'); // Navigate to home only if user is active
      } else {
        // Get.snackbar("Access Denied", "You are not allowed to use this app.");
      }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              strokeWidth: 2,
              color: Color(0xFF00186a),
            ),
            const SizedBox(height: 16),
            Text(
              'Logging you in...',
              style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.black87,
                  fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
    );
  }
}
