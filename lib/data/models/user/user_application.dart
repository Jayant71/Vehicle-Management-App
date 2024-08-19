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
}

extension UserApplicationX on UserApplication {
  UserApplication toEntity() {
    return UserApplication(
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
