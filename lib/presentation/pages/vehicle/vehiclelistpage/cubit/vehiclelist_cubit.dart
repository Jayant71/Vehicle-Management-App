import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vehicle_management_app/domain/usecases/vehicle/get_vehicle_list.dart';
import 'package:vehicle_management_app/data/models/vehicle/vehicle.dart';
import 'package:vehicle_management_app/service_locator.dart';

part 'vehiclelist_state.dart';

class VehiclelistCubit extends Cubit<VehicleListState> {
  final GetVehicleListUsecase getVehicleListUsecase;
  VehiclelistCubit({required this.getVehicleListUsecase})
      : super(VehicleListInitial());

  Future<void> fetchVehicleList() async {
    emit(VehicleListLoading());
    final result = await getVehicleListUsecase.call();
    result.fold(
      (l) {
        emit(VehicleListError(message: l.message));
      },
      (r) {
        emit(VehicleListLoaded(vehicles: r));
      },
    );
  }
}
