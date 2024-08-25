import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'vehicle_list_state.dart';

class VehicleListCubit extends Cubit<VehicleListState> {
  VehicleListCubit() : super(VehicleListInitial());
}
