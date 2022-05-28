import 'package:calculator_flutter/controller/calculate_controller.dart';
import 'package:calculator_flutter/controller/theme_controller.dart';

import 'package:get/instance_manager.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CalculateController());
    Get.lazyPut(() => ThemeController());
  }
}
