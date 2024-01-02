class LoginResponseViewModel {
  final String token;

  LoginResponseViewModel({
    required this.token,
  });

  factory LoginResponseViewModel.fromJson(
    final Map<String, dynamic> json,
  ) =>
      LoginResponseViewModel(
        token: json['token'],
      );
}
