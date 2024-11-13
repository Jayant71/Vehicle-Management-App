import 'package:dartz/dartz.dart';
import 'package:vehicle_management_app/lib/domain/repositories/user/user.dart';

class GetUserUseCase {
  final UserRepository userRepository;

  GetUserUseCase(this.userRepository);

  Future<Either> execute() {
    return userRepository.getUser();
  }
}
