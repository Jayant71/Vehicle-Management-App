import 'package:dartz/dartz.dart';
import 'package:vehicle_management_app/core/usecase/usecase.dart';
import 'package:vehicle_management_app/domain/repositories/user/user.dart';
import 'package:vehicle_management_app/service_locator.dart';

class GetDriverListUseCase extends UseCase<Either, NoParams> {
  @override
  Future<Either> call({NoParams? params}) async {
    return sl<UserRepository>().getDriverList();
  }
}
