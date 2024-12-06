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
  Future<Either> getApplications(bool self, String designation) {
    return sl<FirestoreService>().getApplications(self, designation);
  }

  @override
  Future<Either> updateApplication(String id, Map<String, dynamic> fields) {
    return sl<FirestoreService>().updateApplication(id, fields);
  }
}
