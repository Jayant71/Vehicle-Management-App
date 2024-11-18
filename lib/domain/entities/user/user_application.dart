class UserApplicationEntity {
  final String bookingId;
  final String userId;
  final String sourceName;
  final String destinationName;
  final List<double> sourceCoordinates;
  final List<double> destinationCoordinates;
  final String date;
  final String time;
  final String purpose;
  final String accepted;
  final String driverId;
  final String vehicleId;
  final String createdAt;
  final String roundTrip;

  UserApplicationEntity({
    required this.bookingId,
    required this.userId,
    required this.sourceName,
    required this.destinationName,
    required this.sourceCoordinates,
    required this.destinationCoordinates,
    required this.date,
    required this.time,
    required this.purpose,
    required this.accepted,
    required this.driverId,
    required this.vehicleId,
    required this.createdAt,
    required this.roundTrip,
  });
}
