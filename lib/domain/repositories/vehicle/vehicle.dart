import 'package:dartz/dartz.dart';
import 'package:vehicle_management_app/data/models/vehicle/vehicle.dart';

abstract class VehicleRepository {
  Future<Either> createVehicleDatabase(VehicleModel vehicleModel);

  Future<Either> deleteVehicleDatabase(String id);

  Future<Either> getVehicle(String id);

  Future<Either> getVehicleList();
}
