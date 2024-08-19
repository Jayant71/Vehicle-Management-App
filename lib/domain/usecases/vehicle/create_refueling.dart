import 'package:dartz/dartz.dart';
import 'package:vehicle_management_app/core/usecase/usecase.dart';
import 'package:vehicle_management_app/data/models/vehicle/refueling_record.dart';
import 'package:vehicle_management_app/domain/repositories/vehicle/refueling.dart';
import 'package:vehicle_management_app/service_locator.dart';

class CreateRefuelingUsecase extends UseCase<Either, RefuelingRecord> {
  @override
  Future<Either> call({RefuelingRecord? params}) async {
    return await sl<RefuelingRepository>().createRefuelingDatabase(params!);
  }
}
