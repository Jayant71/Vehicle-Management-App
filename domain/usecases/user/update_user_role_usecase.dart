import 'package:dartz/dartz.dart';
import 'package:vehicle_management_app/lib/domain/repositories/user/user.dart';

class UpdateUserRoleUseCase {
  final UserRepository userRepository;

  UpdateUserRoleUseCase(this.userRepository);

  Future<Either> execute(String id, String role) {
    return userRepository.updateUserRole(id, role);
  }
}
