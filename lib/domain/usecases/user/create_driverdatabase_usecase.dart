import 'package:dartz/dartz.dart';
import 'package:vehicle_management_app/core/usecase/usecase.dart';
import 'package:vehicle_management_app/data/models/user/driver.dart';
import 'package:vehicle_management_app/domain/repositories/user/user.dart';
import 'package:vehicle_management_app/service_locator.dart';

class CreateDriverDatabaseUseCase extends UseCase<Either, DriverModel> {
  @override
  Future<Either> call({DriverModel? params}) async {
    return sl<UserRepository>().createDriverDatabase(params!);
  }
}
