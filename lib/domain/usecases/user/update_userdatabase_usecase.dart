import 'package:dartz/dartz.dart';
import 'package:vehicle_management_app/core/usecase/usecase.dart';
import 'package:vehicle_management_app/domain/repositories/user/user.dart';
import 'package:vehicle_management_app/service_locator.dart';

class UpdateUserDatabaseUseCase extends UseCase<Either, Map<String, dynamic>> {
  final String id;

  UpdateUserDatabaseUseCase(this.id);

  @override
  Future<Either> call({Map<String, dynamic>? params}) async {
    return sl<UserRepository>().updateUserDatabase(id, params!);
  }
}
