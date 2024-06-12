import 'package:rakta_admin/controller/home_controller.dart';
import 'package:get/get.dart';

import '../screens/maps/home_View_Model.dart';

class GetBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(HomeViewModel());

  }
}
