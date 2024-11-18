import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:vehicle_management_app/domain/usecases/vehicle/get_vehicle_list.dart';
import 'package:vehicle_management_app/data/models/vehicle/vehicle.dart';
import 'package:vehicle_management_app/service_locator.dart';

part 'vehiclelist_state.dart';

class VehiclelistCubit extends HydratedCubit<VehicleListState> {
  VehiclelistCubit() : super(VehicleListInitial());

  Future<void> fetchVehicleList() async {
    emit(VehicleListLoading());
    final result = await sl<GetVehicleListUsecase>().call();
    result.fold(
      (l) {
        emit(VehicleListError(message: l.message));
      },
      (r) {
        emit(VehicleListLoaded(vehicles: r));
      },
    );
  }

  @override
  VehicleListState? fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson(VehicleListState state) {
    throw UnimplementedError();
  }
}
