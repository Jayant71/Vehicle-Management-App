import 'package:dartz/dartz.dart';
import 'package:vehicle_management_app/core/usecase/usecase.dart';
import 'package:vehicle_management_app/domain/repositories/user/user.dart';
import 'package:vehicle_management_app/service_locator.dart';

class DeleteUserDatabaseUseCase extends UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return sl<UserRepository>().deleteUserDatabase(params!);
  }
}
