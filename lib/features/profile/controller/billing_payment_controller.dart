import 'package:get/get.dart';

import '../../../core/route/app_route.dart';

class BillingPaymentController extends GetxController {

  void addPaymentMethod() {
Get.toNamed(AppRoute.bank);
  }

  void getStarted() {
    Get.toNamed(AppRoute.bank);
  }
}