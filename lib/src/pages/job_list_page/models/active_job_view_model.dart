class ActiveJobViewModel {
  final String description;
  final int totalSubtasks;
  final int doneSubtasks;
  final String location;
  final num latitude;
  final num longitude;

  ActiveJobViewModel({
    required this.description,
    required this.totalSubtasks,
    required this.doneSubtasks,
    required this.location,
    required this.latitude,
    required this.longitude,
  });

  factory ActiveJobViewModel.fromJson(
    final Map<String, dynamic> json,
  ) =>
      ActiveJobViewModel(
          description: json['description'],
          totalSubtasks: json['totalSubtasks'],
          doneSubtasks: json['doneSubtasks'],
          location: json['location'],
          latitude: json['latitude'],
          longitude: json['longitude']);
}
