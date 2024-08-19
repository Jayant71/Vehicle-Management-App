import 'package:vehicle_management_app/data/models/vehicle/maintenance_record.dart';
import 'package:vehicle_management_app/data/models/vehicle/refueling_record.dart';

class VehicleEntity {
  final String id;
  final String make;
  final String model;
  final int year;
  final List<MaintenanceRecord> maintenanceHistory;
  final List<RefuelingRecord> refuelingHistory;

  VehicleEntity({
    required this.id,
    required this.make,
    required this.model,
    required this.year,
    this.maintenanceHistory = const [],
    this.refuelingHistory = const [],
  });
}
