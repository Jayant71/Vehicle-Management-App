import 'package:dartz/dartz.dart';
import 'package:vehicle_management_app/data/models/user/driver.dart';
import 'package:vehicle_management_app/data/models/user/user.dart';
import 'package:vehicle_management_app/data/sources/firebase_firestore_services.dart';
import 'package:vehicle_management_app/domain/repositories/user/user.dart';
import 'package:vehicle_management_app/service_locator.dart';

class UserRepositoryImpl extends UserRepository {
  @override
  Future<Either> createUserDatabase(UserModel userModel) async {
    return sl<FirestoreService>().createUserDatabase(userModel);
  }

  @override
  Future<Either> createDriverDatabase(DriverModel driverModel) async {
    return sl<FirestoreService>().createDriverDatabase(driverModel);
  }

  @override
  Future<Either> deleteUserDatabase(String id) async {
    return sl<FirestoreService>().deleteUserDatabase(id);
  }

  @override
  Future<Either> getDriver(String id) async {
    return sl<FirestoreService>().getDriver(id);
  }

  @override
  Future<Either> getDriverList() async {
    return sl<FirestoreService>().getDriverList();
  }

  @override
  Future<Either> getUser(String id) async {
    return sl<FirestoreService>().getUser(id);
  }

  @override
  Future<Either> updateUserRole(String id, String role) async {
    return sl<FirestoreService>().updateUserRole(id, role);
  }

  @override
  Future<Either> updateUserDatabase(
      String id, Map<String, dynamic> fields) async {
    return sl<FirestoreService>().updateUserDatabase(id, fields);
  }
}
