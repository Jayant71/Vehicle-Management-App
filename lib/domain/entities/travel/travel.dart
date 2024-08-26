class TravelEntity {
  final String id;
  final String userid;
  final String sourceName;
  final String destinationName;
  final Set<String> sourceCoordinates;
  final Set<String> destinationCoordinates;
  final String startTime;
  final double distance;
  final String endTime;
  final int status;
  final String isRoundTrip;
  final String isBooked;
  final String isCompleted;
  final String onGoing;
  final String isRejected;

  TravelEntity({
    required this.userid,
    required this.id,
    required this.sourceName,
    required this.destinationName,
    required this.sourceCoordinates,
    required this.destinationCoordinates,
    required this.status,
    required this.distance,
    required this.startTime,
    required this.endTime,
    required this.isRoundTrip,
    required this.isBooked,
    required this.isCompleted,
    required this.onGoing,
    required this.isRejected,
  });
}
