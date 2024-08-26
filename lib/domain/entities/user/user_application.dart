class UserApplicationEntity {
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

  UserApplicationEntity({
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
}
