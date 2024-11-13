import 'package:dartz/dartz.dart';
import 'package:vehicle_management_app/lib/domain/repositories/user/user.dart';

class UpdateUserUseCase {
  final UserRepository userRepository;

  UpdateUserUseCase(this.userRepository);

  Future<Either> execute(String id, Map<String, dynamic> fields) {
    return userRepository.updateUserDatabase(id, fields);
  }
}
