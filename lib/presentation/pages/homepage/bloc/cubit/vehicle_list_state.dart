part of 'vehicle_list_cubit.dart';

sealed class VehicleListState extends Equatable {
  const VehicleListState();

  @override
  List<Object> get props => [];
}

final class VehicleListInitial extends VehicleListState {}
