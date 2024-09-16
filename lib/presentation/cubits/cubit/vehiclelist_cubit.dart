import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vehicle_management_app/presentation/pages/homepage/bloc/cubit/vehicle_list_cubit.dart';

part 'vehiclelist_state.dart';

class VehiclelistCubit extends HydratedCubit<VehicleListState> {
  VehiclelistCubit() : super(VehiclelistInitial());

  fetchVehicleList() async {
    emit(VehiclelistLoading());
    try {
      final vehicleList = await getVehicleListUsecase.execute();
      emit(VehiclelistLoaded(vehicleList));
    } catch (e) {
      emit(VehiclelistError(e.toString()));
    }
  }

  @override
  VehicleListState? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson(VehicleListState state) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
