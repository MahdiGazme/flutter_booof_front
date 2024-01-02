class PhoneConfirmationResponseModel {
  final String token;
  final bool phoneVerified;
  final int? code;

  PhoneConfirmationResponseModel({
    required this.token,
    required this.code,
    required this.phoneVerified,
  });

  factory PhoneConfirmationResponseModel.fromJson(
          final Map<String, dynamic> json) =>
      PhoneConfirmationResponseModel(
        code: json['code'],
        token: json['token'],
        phoneVerified: json['phone_verify'],
      );
}
