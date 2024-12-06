class MaintenanceRecord {
  String maintenanceId;
  String driverId;
  String vehicleId;
  String date;
  String description = '';
  List<dynamic> billImgUrl = [];
  String comment = '';
  int status = 2;
  String createdAt;
  String? updatedAt;

  MaintenanceRecord({
    required this.maintenanceId,
    required this.date,
    required this.driverId,
    required this.vehicleId,
    this.description = '',
    required this.billImgUrl,
    required this.createdAt,
    this.updatedAt = ' ',
  });

  factory MaintenanceRecord.fromJson(Map<String, dynamic> json) {
    return MaintenanceRecord(
      maintenanceId: json['maintenanceId'],
      driverId: json['userId'],
      vehicleId: json['vehicleId'],
      date: json['date'],
      description: json['description'],
      billImgUrl: json['billImgUrl'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'maintenanceId': maintenanceId,
      'userId': driverId,
      'vehicleId': vehicleId,
      'date': date,
      'description': description,
      'billImgUrl': billImgUrl,
      'createdAt': createdAt,
    };
  }
}
