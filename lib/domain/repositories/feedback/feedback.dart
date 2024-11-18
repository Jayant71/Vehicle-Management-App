import 'package:dartz/dartz.dart';
import 'package:vehicle_management_app/data/models/feedback/feedback.dart';

abstract class FeedbackRepository {
  Future<Either> createFeedback(FeedbackModel feedbackModel);

  Future<Either> getFeedback(String id);

  Future<Either> getFeedbackList(String type);

  Future<Either> updateFeedback(String id, Map<String, dynamic> fields);
}
