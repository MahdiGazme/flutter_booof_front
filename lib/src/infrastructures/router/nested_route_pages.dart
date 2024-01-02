import 'package:get/get.dart';
import '../../pages/near_jobs_page/commons/near_jobs_page_bindings.dart';
import '../../pages/near_jobs_page/views/near_jobs_page.dart';
import '../utils/constants/nested_keys.dart';
import 'route_names.dart';

class NestedRoutePages {


  Map<int, List<GetPageRoute<dynamic>>> get nestedPages => {
    nestedKeys.jobsListNestedKey: _jobListPages(),
    nestedKeys.balanceNestedKey: [],
    nestedKeys.accountNestedKey: [],
  };

  List<GetPageRoute<dynamic>> _jobListPages() => [
        GetPageRoute(
          routeName: routeNames.nearJobs,
          page: NearJobsPage.new,
          binding: NearJobsPageBinding(),
        ),
      ];
}

final nestedRoutePages = NestedRoutePages();
