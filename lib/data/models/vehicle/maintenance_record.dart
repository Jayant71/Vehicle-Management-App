class MaintenanceRecord {
  final String id;
  String userId;
  final String vehicleId;
  final DateTime date;
  String? description;
  final String billImgUrl;

  MaintenanceRecord({
    required this.id,
    required this.date,
    required this.userId,
    required this.vehicleId,
    this.description = '',
    required this.billImgUrl,
  });

  factory MaintenanceRecord.fromJson(Map<String, dynamic> json) {
    return MaintenanceRecord(
      id: json['id'],
      userId: json['userId'],
      vehicleId: json['vehicleId'],
      date: DateTime.parse(json['date']),
      description: json['description'],
      billImgUrl: json['billImgUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'vehicleId': vehicleId,
      'date': date,
      'description': description,
      'billImgUrl': billImgUrl,
    };
  }
}
