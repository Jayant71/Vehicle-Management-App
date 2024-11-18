import 'package:dartz/dartz.dart';
import 'package:vehicle_management_app/core/usecase/usecase.dart';
import 'package:vehicle_management_app/domain/repositories/application/application.dart';
import 'package:vehicle_management_app/service_locator.dart';

class UpdateApplicationsUsecase extends UseCase<Either, Map<String, dynamic>> {
  @override
  Future<Either> call({String? id, Map<String, dynamic>? params}) async {
    return sl<ApplicationRepository>().updateApplication(id!, params!);
  }
}