import 'package:vehicle_management_app/domain/entities/user/user_application.dart';

class UserApplication {
  final String bookingId;
  final String userId;
  final String sourceName;
  final String destinationName;
  final String sourceCoordinates;
  final String destinationCoordinates;
  final String date;
  final String time;
  final String accepted;
  final String driverId;
  final String vehicleId;
  final String createdAt;
  final String roundTrip;

  UserApplication({
    required this.bookingId,
    required this.userId,
    required this.sourceName,
    required this.destinationName,
    required this.sourceCoordinates,
    required this.destinationCoordinates,
    required this.date,
    required this.time,
    required this.accepted,
    required this.driverId,
    required this.vehicleId,
    required this.createdAt,
    required this.roundTrip,
  });

  factory UserApplication.fromJson(Map<String, dynamic> json) {
    return UserApplication(
      bookingId: json['bookingId'],
      userId: json['userId'],
      sourceName: json['sourceName'],
      destinationName: json['destinationName'],
      sourceCoordinates: json['sourceCoordinates'],
      destinationCoordinates: json['destinationCoordinates'],
      date: json['date'],
      time: json['time'],
      accepted: json['accepted'],
      driverId: json['driverId'],
      vehicleId: json['vehicleId'],
      createdAt: json['createdAt'],
      roundTrip: json['roundTrip'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bookingId': bookingId,
      'userId': userId,
      'sourceName': sourceName,
      'destinationName': destinationName,
      'sourceCoordinates': sourceCoordinates,
      'destinationCoordinates': destinationCoordinates,
      'date': date,
      'time': time,
      'accepted': accepted,
      'driverId': driverId,
      'vehicleId': vehicleId,
      'createdAt': createdAt,
      'roundTrip': roundTrip,
    };
  }
}

extension UserApplicationX on UserApplication {
  UserApplicationEntity toEntity() {
    return UserApplicationEntity(
      bookingId: bookingId,
      userId: userId,
      sourceName: sourceName,
      destinationName: destinationName,
      sourceCoordinates: sourceCoordinates,
      destinationCoordinates: destinationCoordinates,
      date: date,
      time: time,
      accepted: accepted,
      driverId: driverId,
      vehicleId: vehicleId,
      createdAt: createdAt,
      roundTrip: roundTrip,
    );
  }
}