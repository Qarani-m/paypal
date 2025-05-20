import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

class StorageUtils {
  static final _box = GetStorage();

  static int getFontLevel() {
    return _box.read<int>('font_level') ?? 1;
  }

  static void setFontLevel(int value) {
    _box.write('font_level', value);
  }
}






class FontSliderController extends GetxController {
  RxInt fontLevel = StorageUtils.getFontLevel().obs;

  void updateFontLevel(double value) {
    fontLevel.value = value.toInt();
    StorageUtils.setFontLevel(fontLevel.value);
  }
}
