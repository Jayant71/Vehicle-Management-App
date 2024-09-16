import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'vehicle_list_state.dart';

class VehicleListCubit extends HydratedCubit<VehicleListState> {
  VehicleListCubit() : super(const VehicleListInitial());

  @override
  VehicleListState? fromJson(Map<String, dynamic> json) {
    return const VehicleListInitial();
  }

  @override
  Map<String, dynamic>? toJson(VehicleListState state) {
    return {};
  }
}
