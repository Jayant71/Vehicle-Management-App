class RefuelingRecord {
  String refuelingId;
  String userId;
  String vehicleId;
  String date;
  double amount;
  // String billImgUrl;
  String comment = '';

  RefuelingRecord({
    required this.refuelingId,
    required this.date,
    required this.userId,
    required this.vehicleId,
    required this.amount,
    // required this.billImgUrl,
    this.comment = '',
  });

  factory RefuelingRecord.fromJson(Map<String, dynamic> json) {
    return RefuelingRecord(
      refuelingId: json['refuelingId'],
      userId: json['userId'],
      vehicleId: json['vehicleId'],
      date: json['date'],
      amount: json['amount'],
      // billImgUrl: json['billImgUrl'],
      comment: json['comment'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'refuelingId': refuelingId,
      'userId': userId,
      'vehicleId': vehicleId,
      'date': date,
      'amount': amount,
      // 'billImgUrl': billImgUrl,
      'comment': comment,
    };
  }
}
