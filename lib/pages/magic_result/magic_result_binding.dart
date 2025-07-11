import 'package:get/get.dart';

import 'magic_result_logic.dart';

class MagicResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MagicResultLogic());
  }
}
