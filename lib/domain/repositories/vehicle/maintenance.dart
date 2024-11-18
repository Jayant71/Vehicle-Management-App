import 'package:dartz/dartz.dart';
import 'package:vehicle_management_app/data/models/vehicle/maintenance_record.dart';

abstract class MaintenanceRepository {
  Future<Either> createMaintenanceDatabase(MaintenanceRecord maintenanceRecord);

  // Future<Either> deleteMaintenanceDatabase(String id);

  Future<Either> getMaintenance(String id);

  Future<Either> getMaintenanceList(String vehicleId);
}
