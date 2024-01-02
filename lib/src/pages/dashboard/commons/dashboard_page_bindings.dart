import 'package:get/get.dart';

import '../../balance_page/controller/balance_page_controller.dart';
import '../../balance_page/repository/balance_page_repository.dart';
import '../../electronic_signature_page/controller/electronic_signature_page_controller.dart';
import '../../electronic_signature_page/repository/electronic_signature_page_repository.dart';
import '../../job_list_page/controller/job_list_page_controller.dart';
import '../../job_list_page/repository/job_list_page_repository.dart';
import '../controller/dashboard_page_controller.dart';

class DashboardPageBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(
      () => JobListPageController(
        JobListPageRepository(),
      ),
    );

    Get.lazyPut(
          () => BalancePageController(
        BalancePageRepository(),
      ),
    );

    Get.lazyPut(
          () => ElectronicSignaturePageController(
        ElectronicSignaturePageRepository(),
      ),
    );

    Get.lazyPut(
      DashboardPageController.new,
    );
  }
}
