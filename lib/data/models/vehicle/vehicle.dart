import 'package:vehicle_management_app/domain/entities/vehicle/vehicle.dart';

class VehicleModel {
  final String vehicleId;
  final String registrationNumber;
  final String name;
  final String brand;
  final String imageUrl;
  final String driverId;
  final String availablity;

  VehicleModel({
    required this.vehicleId,
    required this.registrationNumber,
    required this.name,
    required this.brand,
    required this.imageUrl,
    required this.driverId,
    required this.availablity,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      vehicleId: json['vechicleId'],
      name: json['name'],
      brand: json['brand'],
      imageUrl: json['imageUrl'],
      driverId: json['driverId'],
      registrationNumber: json['registrationNumber'],
      availablity: json['availablity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'vehicleId': vehicleId,
      'name': name,
      'brand': brand,
      // 'imageUrl': imageUrl,
      'driverId': driverId,
      'registrationNumber': registrationNumber,
      'availablity': availablity,
    };
  }
}

extension VehicleModelX on VehicleModel {
  VehicleEntity toEntity() {
    return VehicleEntity(
      vehicleId: vehicleId,
      name: name,
      brand: brand,
      // imageUrl: imageUrl,
      driverId: driverId,
      registrationNumber: registrationNumber,
      availablity: availablity,
    );
  }
}
