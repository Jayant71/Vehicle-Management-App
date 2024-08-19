import 'package:dartz/dartz.dart';
import 'package:vehicle_management_app/data/models/user/user.dart';

abstract class UserRepository {
  Future<Either> createUserDatabase(UserModel userModel);

  Future<Either> deleteUserDatabase(String id);

  Future<Either> getUser();
}
