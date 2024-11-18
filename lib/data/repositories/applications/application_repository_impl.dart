import 'package:dartz/dartz.dart';
import 'package:vehicle_management_app/data/models/user/user_application.dart';
import 'package:vehicle_management_app/data/sources/firebase_firestore_services.dart';
import 'package:vehicle_management_app/domain/repositories/application/application.dart';
import 'package:vehicle_management_app/service_locator.dart';

class ApplicationRepositoryImpl extends ApplicationRepository {
  @override
  Future<Either> createApplication(UserApplication userApplication) {
    return sl<FirestoreService>().createApplication(userApplication);
  }

  @override
  Future<Either> getApplication(String id) {
    return sl<FirestoreService>().getApplication(id);
  }

  @override
  Future<Either> getApplications(
      bool self, String designation, String status, String branch) {
    return sl<FirestoreService>()
        .getApplications(self, designation, status, branch);
  }

  @override
  Future<Either> getBranchApplications(String branch, String status) {
    return sl<FirestoreService>().getBranchApplications(branch, status);
  }

  @override
  Future<Either> getSelfApplications(String userId, String status) {
    return sl<FirestoreService>().getSelfApplications(userId, status);
  }

  @override
  Future<Either> updateApplication(String id, Map<String, dynamic> fields) {
    return sl<FirestoreService>().updateApplication(id, fields);
  }
}
