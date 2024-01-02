import 'package:milky_http_client/milky_http_client.dart';

import '../../../flutter_booof_module.dart';
import '../utils/constants/utils.dart';
import 'authorize_interceptor.dart';
import 'token_interceptor.dart';

class HttpClientUtils {
  MilkyHttpClient httpClient({
    final String? baseUrl,
    final Map<String, dynamic>? headers,
    final bool showError = true,
  }) =>
      MilkyHttpClient(
        baseUrl: baseUrl ?? booofModuleParameters.fullBaseUrl,
        headers: headers,
        handleExceptionCallBack: (final exception) =>
            handleException(exception, showError: showError),
        sendTimeout: utils.defaultTimeOutDuration,
        connectTimeout: utils.defaultTimeOutDuration,
        receiveTimeout: utils.defaultTimeOutDuration,
        interceptors: [
          TokenInterceptor(),
          AuthorizeInterceptor(),
        ],
      );

  void handleException(
    final String exceptionKey, {
    final bool showError = true,
  }) {
    if (exceptionKey == 'cancel') {
      return;
    }

    if (showError) {
      // shows snack bar with translated exception if translate exists
      // CustomSnackBar.snackBar(
      //   'Error',
      //   '',
      //   messageText: Text(
      //     _translateException(
      //       exceptionKey,
      //     ),
      //   ),
      // );
    }
  }

  String _translateException(final String exceptionKey) {
    const String prefix = 'flutter_sample_app_exceptions';
    final String key = '$prefix$exceptionKey';
    return 'Other - $exceptionKey';

    // return _isKnownException(key) ? key.tr : 'Other - $exceptionKey';
  }
//
// bool _isKnownException(final String exceptionKey) =>
//     Locales.fa_IR.containsKey(exceptionKey);
}

final httpClientUtils = HttpClientUtils();
