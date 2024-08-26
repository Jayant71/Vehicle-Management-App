import 'package:vehicle_management_app/domain/entities/travel/travel.dart';

class TravelModel {
  final String id;
  final String userid;
  final String sourceName;
  final String destinationName;
  final Set<String> sourceCoordinates;
  final Set<String> destinationCoordinates;
  final String startTime;
  final String endTime;
  final double distance;
  final int status;
  final String isRoundTrip;
  final String isBooked;
  final String isCompleted;
  final String onGoing;
  final String isRejected;

  TravelModel({
    required this.userid,
    required this.id,
    required this.sourceName,
    required this.destinationName,
    required this.sourceCoordinates,
    required this.destinationCoordinates,
    required this.status,
    required this.startTime,
    required this.distance,
    required this.endTime,
    required this.isRoundTrip,
    required this.isBooked,
    required this.isCompleted,
    required this.onGoing,
    required this.isRejected,
  });

  TravelModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        userid = json['userid'],
        sourceName = json['sourceName'],
        destinationName = json['destinationName'],
        sourceCoordinates = json['sourceCoordinates'],
        destinationCoordinates = json['destinationCoordinates'],
        distance = json['distance'],
        status = json['status'],
        startTime = json['startTime'],
        endTime = json['endTime'],
        isRoundTrip = json['isRoundTrip'],
        isBooked = json['isBooked'],
        isCompleted = json['isCompleted'],
        onGoing = json['onGoing'],
        isRejected = json['isRejected'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userid': userid,
      'sourceName': sourceName,
      'destinationName': destinationName,
      'sourceCoordinates': sourceCoordinates,
      'distance': distance,
      'destinationCoordinates': destinationCoordinates,
      'status': status,
      'startTime': startTime,
      'endTime': endTime,
      'isRoundTrip': isRoundTrip,
      'isBooked': isBooked,
      'isCompleted': isCompleted,
      'onGoing': onGoing,
      'isRejected': isRejected,
    };
  }
}

extension TravelModelX on TravelModel {
  TravelEntity toEntity() {
    return TravelEntity(
      userid: userid,
      id: id,
      sourceName: sourceName,
      destinationName: destinationName,
      sourceCoordinates: sourceCoordinates,
      destinationCoordinates: destinationCoordinates,
      status: status,
      distance: distance,
      startTime: startTime,
      endTime: endTime,
      isRoundTrip: isRoundTrip,
      isBooked: isBooked,
      isCompleted: isCompleted,
      onGoing: onGoing,
      isRejected: isRejected,
    );
  }
}
