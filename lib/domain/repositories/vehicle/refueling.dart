import 'package:dartz/dartz.dart';
import 'package:vehicle_management_app/data/models/vehicle/refueling_record.dart';

abstract class RefuelingRepository {
  Future<Either> createRefuelingDatabase(RefuelingRecord refuelingRecord);

  // Future<Either> deleteRefuelingDatabase(String id);

  Future<Either> getRefueling(String id);

  Future<Either> getRefuelingList(String vehicleId);
}
