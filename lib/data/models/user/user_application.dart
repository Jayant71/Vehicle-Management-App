import 'package:vehicle_management_app/domain/entities/user/user_application.dart';

class UserApplication {
  final String id;
  final String source;
  final String destination;
  final String sourceCoordinates;
  final String destinationCoordinates;
  final String date;
  final String time;
  final String status;
  final String driverId;
  final String vehicleId;
  final String userId;
  final String driverName;
  final String driverPhone;
  final int statusIndex;

  UserApplication({
    required this.status,
    required this.driverId,
    required this.vehicleId,
    required this.userId,
    required this.driverName,
    required this.driverPhone,
    required this.statusIndex,
    required this.id,
    required this.source,
    required this.destination,
    required this.sourceCoordinates,
    required this.destinationCoordinates,
    required this.date,
    required this.time,
  });

  UserApplication.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        source = json['source'],
        destination = json['destination'],
        sourceCoordinates = json['sourceCoordinates'],
        destinationCoordinates = json['destinationCoordinates'],
        date = json['date'],
        time = json['time'],
        status = json['status'],
        driverId = json['driverId'],
        vehicleId = json['vehicleId'],
        userId = json['userId'],
        driverName = json['driverName'],
        driverPhone = json['driverPhone'],
        statusIndex = json['statusIndex'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'source': source,
      'destination': destination,
      'sourceCoordinates': sourceCoordinates,
      'destinationCoordinates': destinationCoordinates,
      'date': date,
      'time': time,
      'status': status,
      'driverId': driverId,
      'vehicleId': vehicleId,
      'userId': userId,
      'driverName': driverName,
      'driverPhone': driverPhone,
      'statusIndex': statusIndex,
    };
  }
}

extension UserApplicationX on UserApplication {
  UserApplicationEntity toEntity() {
    return UserApplicationEntity(
      status: status,
      driverId: driverId,
      vehicleId: vehicleId,
      userId: userId,
      driverName: driverName,
      driverPhone: driverPhone,
      statusIndex: statusIndex,
      id: id,
      source: source,
      destination: destination,
      sourceCoordinates: sourceCoordinates,
      destinationCoordinates: destinationCoordinates,
      date: date,
      time: time,
    );
  }
}
