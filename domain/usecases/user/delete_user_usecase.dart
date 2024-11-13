import 'package:dartz/dartz.dart';
import 'package:vehicle_management_app/lib/domain/repositories/user/user.dart';

class DeleteUserUseCase {
  final UserRepository userRepository;

  DeleteUserUseCase(this.userRepository);

  Future<Either> execute(String id) {
    return userRepository.deleteUserDatabase(id);
  }
}
