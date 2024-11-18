import 'package:dartz/dartz.dart';
import 'package:vehicle_management_app/data/models/vehicle/vehicle.dart';
import 'package:vehicle_management_app/data/sources/firebase_firestore_services.dart';
import 'package:vehicle_management_app/domain/repositories/vehicle/vehicle.dart';
import 'package:vehicle_management_app/service_locator.dart';

class VehicleRepositoryImpl extends VehicleRepository {
  @override
  Future<Either> createVehicleDatabase(VehicleModel vehicleModel) {
    throw UnimplementedError();
  }

  @override
  Future<Either> deleteVehicleDatabase(String id) async {
    return await sl<FirestoreService>().deleteVehicleDatabase(id);
  }

  @override
  Future<Either> getVehicle(String id) async {
    return await sl<FirestoreService>().getVehicle(id);
  }

  @override
  Future<Either> getVehicleList() async {
    return await sl<FirestoreService>().getVehicleList();
  }
}
