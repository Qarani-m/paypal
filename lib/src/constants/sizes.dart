import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:paypal/src/utils/font_sizes.dart';

 
 

class AppSizes {
  static final RxInt fontLevel = StorageUtils.getFontLevel().obs;
  
  static double getMultiplier() => 1 + (fontLevel.value * 0.1);

  static double get sp6 => (6 * getMultiplier()).sp;
  static double get sp7 => (7 * getMultiplier()).sp;
  static double get sp8 => (8 * getMultiplier()).sp;
  static double get sp9 => (9 * getMultiplier()).sp;
  static double get sp10 => (10 * getMultiplier()).sp;
  static double get sp11 => (11 * getMultiplier()).sp;
  static double get sp12 => (12 * getMultiplier()).sp;
  static double get sp13 => (13 * getMultiplier()).sp;
  static double get sp14 => (14 * getMultiplier()).sp;
  static double get sp15 => (15 * getMultiplier()).sp;
  static double get sp16 => (16 * getMultiplier()).sp;
  static double get sp17 => (17 * getMultiplier()).sp;
  static double get sp18 => (18 * getMultiplier()).sp;
  static double get sp19 => (19 * getMultiplier()).sp;
  static double get sp20 => (20 * getMultiplier()).sp;
  static double get sp21 => (21 * getMultiplier()).sp;
  static double get sp22 => (22 * getMultiplier()).sp;

  static void updateFontLevel(int level) {
    fontLevel.value = level;
  }
}
