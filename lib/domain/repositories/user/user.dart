import 'package:dartz/dartz.dart';
import 'package:vehicle_management_app/data/models/user/driver.dart';
import 'package:vehicle_management_app/data/models/user/user.dart';

abstract class UserRepository {
  Future<Either> createUserDatabase(UserModel userModel);

  Future<Either> deleteUserDatabase(String id);

  Future<Either> getUser(String id);

  Future<Either> updateUserDatabase(String id, Map<String, dynamic> fields);

  Future<Either> updateUserRole(String id, String role);

  Future<Either> createDriverDatabase(DriverModel driverModel);

  Future<Either> getDriverList();

  Future<Either> getDriver(String id);
}
