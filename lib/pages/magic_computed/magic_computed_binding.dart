import 'package:get/get.dart';

import 'magic_computed_logic.dart';

class MagicComputedBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      MagicComputedLogic(),
      permanent: true,
    );
  }
}
