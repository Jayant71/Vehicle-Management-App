import 'package:dartz/dartz.dart';
import 'package:vehicle_management_app/core/usecase/usecase.dart';
import 'package:vehicle_management_app/data/models/vehicle/vehicle.dart';
import 'package:vehicle_management_app/domain/repositories/vehicle/vehicle.dart';
import 'package:vehicle_management_app/service_locator.dart';

class CreateVehicleUsecase extends UseCase<Either, VehicleModel> {
  @override
  Future<Either> call({VehicleModel? params}) async {
    return sl<VehicleRepository>().createVehicleDatabase(params!);
  }
}
