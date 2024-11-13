import 'package:dartz/dartz.dart';
import 'package:vehicle_management_app/data/models/user/user.dart';
import 'package:vehicle_management_app/lib/domain/repositories/user/user.dart';

class CreateUserUseCase {
  final UserRepository userRepository;

  CreateUserUseCase(this.userRepository);

  Future<Either> execute(UserModel userModel) {
    return userRepository.createUserDatabase(userModel);
  }
}
