class AvailableJobsViewModel {
  final String? avatarId;
  final String companyName;
  final String location;
  final String description;
  final String employerName;
  final double payment;
  final int subtasks;

  AvailableJobsViewModel({
    required this.companyName,
    required this.location,
    required this.description,
    required this.employerName,
    required this.payment,
    required this.subtasks,
    this.avatarId,
  });

  factory AvailableJobsViewModel.fromJson(final Map<String, dynamic> json) =>
      AvailableJobsViewModel(
        avatarId: json['avatarId'],
        companyName: json['companyName'],
        location: json['location'],
        description: json['description'],
        employerName: json['employerName'],
        payment: json['payment'],
        subtasks: json['subtasks'],
      );
}
