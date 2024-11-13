import 'package:dartz/dartz.dart';
import 'package:vehicle_management_app/lib/domain/repositories/user/user.dart';

class GetDriverListUseCase {
  final UserRepository userRepository;

  GetDriverListUseCase(this.userRepository);

  Future<Either> execute() {
    return userRepository.getDriverList();
  }
}
