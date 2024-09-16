import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'vehiclelist_event.dart';
part 'vehiclelist_state.dart';

class VehiclelistBloc extends Bloc<VehiclelistEvent, VehiclelistState> {
  VehiclelistBloc() : super(VehiclelistInitial()) {
    on<VehiclelistEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
