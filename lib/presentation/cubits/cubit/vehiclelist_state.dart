part of 'vehiclelist_cubit.dart';

sealed class VehiclelistState extends Equatable {
  const VehiclelistState();

  @override
  List<Object> get props => [];
}

final class VehiclelistInitial extends VehiclelistState {}
