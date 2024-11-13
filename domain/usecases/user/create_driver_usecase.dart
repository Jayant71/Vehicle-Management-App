import 'package:dartz/dartz.dart';
import 'package:vehicle_management_app/data/models/user/driver.dart';
import 'package:vehicle_management_app/lib/domain/repositories/user/user.dart';

class CreateDriverUseCase {
  final UserRepository userRepository;

  CreateDriverUseCase(this.userRepository);

  Future<Either> execute(DriverModel driverModel) {
    return userRepository.createDriverDatabase(driverModel);
  }
}
