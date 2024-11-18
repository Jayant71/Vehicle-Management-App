import 'package:dartz/dartz.dart';
import 'package:vehicle_management_app/data/models/feedback/feedback.dart';
import 'package:vehicle_management_app/data/sources/firebase_firestore_services.dart';
import 'package:vehicle_management_app/domain/repositories/feedback/feedback.dart';
import 'package:vehicle_management_app/service_locator.dart';

class FeedbackRepositoryImpl extends FeedbackRepository {
  @override
  Future<Either> createFeedback(FeedbackModel feedbackModel) {
    return sl<FirestoreService>().createFeedback(feedbackModel);
  }

  @override
  Future<Either> getFeedback(String id) {
    return sl<FirestoreService>().getFeedback(id);
  }

  @override
  Future<Either> getFeedbackList(String type) {
    return sl<FirestoreService>().getFeedbackList(type);
  }

  @override
  Future<Either> updateFeedback(String id, Map<String, dynamic> fields) {
    return sl<FirestoreService>().updateFeedback(id, fields);
  }
}
