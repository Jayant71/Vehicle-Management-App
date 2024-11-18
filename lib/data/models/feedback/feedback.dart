class FeedbackModel {
  final String userId;
  final String rideId;
  final int rating;
  final String comments;

  FeedbackModel({
    required this.userId,
    required this.rideId,
    required this.rating,
    required this.comments,
  });

  factory FeedbackModel.fromJson(Map<String, dynamic> json) {
    return FeedbackModel(
      userId: json['userId'],
      rideId: json['rideId'],
      rating: json['rating'],
      comments: json['comments'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'rideId': rideId,
      'rating': rating,
      'comments': comments,
    };
  }
}
