class RefuelingRecord {
  String refuelingId;
  String userId;
  String vehicleId;
  String date;
  double amount;
  List<dynamic> billImgUrl = [];
  int status = 2;
  String comment = '';
  String createdAt;
  String? updatedAt;

  RefuelingRecord({
    required this.refuelingId,
    required this.date,
    required this.userId,
    required this.vehicleId,
    required this.amount,
    required this.billImgUrl,
    this.comment = '',
    required this.createdAt,
    this.updatedAt = ' ',
  });

  factory RefuelingRecord.fromJson(Map<String, dynamic> json) {
    return RefuelingRecord(
      refuelingId: json['refuelingId'],
      userId: json['userId'],
      vehicleId: json['vehicleId'],
      date: json['date'],
      amount: json['amount'],
      billImgUrl: json['billImgUrl'],
      comment: json['comment'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'refuelingId': refuelingId,
      'userId': userId,
      'vehicleId': vehicleId,
      'date': date,
      'amount': amount,
      'billImgUrl': billImgUrl,
      'comment': comment,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
