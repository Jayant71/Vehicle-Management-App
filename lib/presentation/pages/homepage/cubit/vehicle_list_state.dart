part of 'vehicle_list_cubit.dart';

abstract class VehicleListState extends Equatable {
  const VehicleListState();

  @override
  List<Object> get props => [];
}

class VehicleListInitial extends VehicleListState {
  const VehicleListInitial();
}
