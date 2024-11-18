import 'package:dartz/dartz.dart';
import 'package:vehicle_management_app/data/models/vehicle/maintenance_record.dart';
import 'package:vehicle_management_app/data/sources/firebase_firestore_services.dart';
import 'package:vehicle_management_app/domain/repositories/vehicle/maintenance.dart';
import 'package:vehicle_management_app/service_locator.dart';

class MaintenanceRepositoryImpl extends MaintenanceRepository {
  @override
  Future<Either> createMaintenanceDatabase(
      MaintenanceRecord maintenanceRecord) async {
    return await sl<FirestoreService>()
        .createMaintenanceDatabase(maintenanceRecord);
  }

  // @override
  // Future<Either> deleteMaintenanceDatabase(String id) async {
  //   return await sl<FirestoreService>().deleteMaintenanceDatabase(id);
  // }

  @override
  Future<Either> getMaintenance(String id) async {
    return await sl<FirestoreService>().getMaintenance(id);
  }

  @override
  Future<Either> getMaintenanceList(String vehicleId) async {
    return await sl<FirestoreService>().getMaintenanceList(vehicleId);
  }
}
