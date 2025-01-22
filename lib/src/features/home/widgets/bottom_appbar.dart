

// lib/widgets/custom_bottom_nav/custom_bottom_navigation_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:paypal/src/features/home/controllers/navigation_controller.dart';
import 'package:paypal/src/features/home/models/nav_item.dart';
 
class CustomBottomNavigationBar extends GetView<NavigationController> {
  final List<NavItem> items;
  final Color selectedColor;
  final Color unselectedColor;
  final Color backgroundColor;
  final double? height;
  final double iconSize;
  final double fontSize;

  const CustomBottomNavigationBar({
    Key? key,
    required this.items,
    this.selectedColor = Colors.blue,
    this.unselectedColor = Colors.grey,
    this.backgroundColor = Colors.white,
    this.height,
    this.iconSize = 24,
    this.fontSize = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              items.length,
              (index) => _buildNavItem(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index) {
    final item = items[index];
    
    return Obx(() {
      final isSelected = controller.selectedIndex == index;
      
      return GestureDetector(
        onTap: () => controller.changePage(index),
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              item.svgPath,
              height: 12.h,
              width: 12.h,
              color: isSelected ? selectedColor : unselectedColor,
            ),
            const SizedBox(height: 4),
            Text(
              item.label,
              style: TextStyle(
                fontSize: fontSize.sp,
                
                color: isSelected ? selectedColor : unselectedColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );
    });
  }
}