import 'package:dartz/dartz.dart';
import 'package:vehicle_management_app/core/usecase/usecase.dart';
import 'package:vehicle_management_app/domain/repositories/vehicle/refueling.dart';
import 'package:vehicle_management_app/service_locator.dart';

class GetRefuelingListUsecase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<RefuelingRepository>().getRefuelingList(params!);
  }
}
