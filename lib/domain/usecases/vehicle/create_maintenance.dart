import 'package:dartz/dartz.dart';
import 'package:vehicle_management_app/core/usecase/usecase.dart';
import 'package:vehicle_management_app/data/models/vehicle/maintenance_record.dart';
import 'package:vehicle_management_app/domain/repositories/vehicle/maintenance.dart';
import 'package:vehicle_management_app/service_locator.dart';

class CreateMaintenanceUsecase extends UseCase<Either, MaintenanceRecord> {
  @override
  Future<Either> call({MaintenanceRecord? params}) async {
    return sl<MaintenanceRepository>().createMaintenanceDatabase(params!);
  }
}
