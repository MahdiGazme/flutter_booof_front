class ApiKeys {

  //   ----> FCM Token <----

  final String refreshFcmToken = '/worker/fcm';

  //   ----> Signature <----

  final String getSignature = '/asa/fcm';
  final String postSignature = '/asa/fcm';

//   ----> authentication <----

  final String login = '/user/auth';
  final String signUp = '/worker';
  final String phoneConfirmation = '/user/register';
  final String confirmCode = '/system/sms/confirmation';

//   ----> Jobs list page <----

  String jobsList(final String query) => '/user/auth$query';
  final String activeJob = '/user/confirmCode';

//   ----> Near Jobs page <----
  String nearJobs(final String query) => '/user/auth$query';

//   ----> Balance Page <----
  String getDoneTasks(final String query) => '/user/auth$query';
}

final apiKeys = ApiKeys();
