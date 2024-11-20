import 'package:dartz/dartz.dart';
import 'package:vehicle_management_app/data/models/user/user_application.dart';

abstract class ApplicationRepository {
  Future<Either> createApplication(UserApplication userApplication);
  Future<Either> updateApplication(String id, Map<String, dynamic> fields);
  Future<Either> getApplications(bool self, String designation);
  Future<Either> getApplication(String id);
  Future<Either> getSelfApplications(String userId, String status);
  Future<Either> getBranchApplications(String branch, String status);
}
