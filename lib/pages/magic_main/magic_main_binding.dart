import 'package:get/get.dart';

import 'magic_main_logic.dart';

class MagicMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MagicMainLogic());
  }
}
