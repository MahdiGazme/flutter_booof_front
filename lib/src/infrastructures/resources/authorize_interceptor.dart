import 'package:milky_http_client/milky_http_client.dart';
import '../../shared/widget/custom_snack_bar.dart';
import '../utils/log_out_handler.dart';

class AuthorizeInterceptor extends Interceptor {
  @override
  void onError(
    final DioException err,
    final ErrorInterceptorHandler handler,
  ) {
    if (err.response?.statusCode == 401) {
      //TODO:  uncomment
      // LogOutHandler().logOut();
      CustomSnackBar.snackBar(
        'Warning',
        'New Log-in needed',
        hasBottomMargin: false,
      );
    }

    super.onError(err, handler);
  }
}
