class NearJobsViewModel {
  final String id;
  final String employerName;
  final String companyName;
  final double payment;
  final String address;
  final int subtasks;
  final DateTime date;
  final double latitude;
  final double longitude;
  final String? avatar;

  NearJobsViewModel({
    required this.id,
    required this.employerName,
    required this.companyName,
    required this.payment,
    required this.address,
    required this.subtasks,
    required this.date,
    required this.latitude,
    required this.longitude,
    this.avatar,
  });

  factory NearJobsViewModel.fromJson(
    final Map<String, dynamic> json,
  ) =>
      NearJobsViewModel(
        id: json['id'],
        avatar: json['avatar'],
        employerName: json['employerName'],
        companyName: json['companyName'],
        payment: json['payment'],
        address: json['address'],
        subtasks: json['subtasks'],
        date: json['date'],
        latitude: json['latitude'],
        longitude: json['latitude'],
      );
}
