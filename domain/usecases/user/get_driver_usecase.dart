import 'package:dartz/dartz.dart';
import 'package:vehicle_management_app/lib/domain/repositories/user/user.dart';

class GetDriverUseCase {
  final UserRepository userRepository;

  GetDriverUseCase(this.userRepository);

  Future<Either> execute(String id) {
    return userRepository.getDriver(id);
  }
}
