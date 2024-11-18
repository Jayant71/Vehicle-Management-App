class MaintenanceRecord {
  String maintenanceId;
  String userId;
  String vehicleId;
  String date;
  String? description;
  // String billImgUrl;
  String createdAt;
  String? updatedAt;

  MaintenanceRecord({
    required this.maintenanceId,
    required this.date,
    required this.userId,
    required this.vehicleId,
    this.description = '',
    // required this.billImgUrl,
    required this.createdAt,
    this.updatedAt = ' ',
  });

  factory MaintenanceRecord.fromJson(Map<String, dynamic> json) {
    return MaintenanceRecord(
      maintenanceId: json['maintenanceId'],
      userId: json['userId'],
      vehicleId: json['vehicleId'],
      date: json['date'],
      description: json['description'],
      // billImgUrl: json['billImgUrl'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'maintenanceId': maintenanceId,
      'userId': userId,
      'vehicleId': vehicleId,
      'date': date,
      'description': description,
      // 'billImgUrl': billImgUrl,
      'createdAt': createdAt,
    };
  }
}
