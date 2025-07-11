import 'package:get/get.dart';

import 'magic_disconnect_logic.dart';

class MagicDisconnectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MagicDisconnectLogic());
  }
}
