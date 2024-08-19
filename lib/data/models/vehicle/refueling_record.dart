class RefuelingRecord {
  final String id;
  final DateTime date;
  String userId;
  final String vehicleId;

  final double amount;
  final String billImgUrl;

  RefuelingRecord({
    required this.id,
    required this.date,
    required this.userId,
    required this.vehicleId,
    required this.amount,
    required this.billImgUrl,
  });

  factory RefuelingRecord.fromJson(Map<String, dynamic> json) {
    return RefuelingRecord(
      id: json['id'],
      userId: json['userId'],
      vehicleId: json['vehicleId'],
      date: DateTime.parse(json['date']),
      amount: json['amount'],
      billImgUrl: json['billImgUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'vehicleId': vehicleId,
      'date': date,
      'amount': amount,
      'billImgUrl': billImgUrl,
    };
  }
}
