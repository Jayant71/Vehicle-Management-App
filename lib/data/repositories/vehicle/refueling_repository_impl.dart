import 'package:dartz/dartz.dart';
import 'package:vehicle_management_app/data/models/vehicle/refueling_record.dart';
import 'package:vehicle_management_app/domain/repositories/vehicle/refueling.dart';

class RefuelingRepositoryImpl extends RefuelingRepository {
  @override
  Future<Either> createRefuelingDatabase(RefuelingRecord refuelingRecord) {
    throw UnimplementedError();
  }

  // @override
  // Future<Either> deleteRefuelingDatabase(String id) {
  //   throw UnimplementedError();
  // }

  @override
  Future<Either> getRefueling(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either> getRefuelingList(String vehicleId) {
    throw UnimplementedError();
  }
}
