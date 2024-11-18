import 'package:vehicle_management_app/domain/entities/vehicle/vehicle.dart';

class VehicleModel {
  final String vehicleId;
  final String registrationNumber;
  final String type;
  final String manufacturer;
  final String brand;
  final String status;
  final String fuelType;
  final int? year;
  String? owner = "CSVTU";
  String? user = "";
  String? remark = "";
  final String driverId;
  String imageUrl = "";

  VehicleModel({
    required this.vehicleId,
    required this.registrationNumber,
    required this.type,
    required this.manufacturer,
    required this.brand,
    required this.status,
    required this.fuelType,
    this.year,
    this.owner,
    this.user,
    this.remark,
    required this.driverId,
    required this.imageUrl,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      vehicleId: json['vehicleId'],
      registrationNumber: json['registrationNumber'],
      type: json['type'],
      manufacturer: json['manufacturer'],
      brand: json['brand'],
      status: json['status'] ?? 'Unavailable',
      fuelType: json['fuelType'],
      year: json['year'] != null ? int.parse(json['year'].toString()) : null,
      owner: json['owner'],
      user: json['user'],
      remark: json['remark'],
      driverId: json['driverId'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'vehicleId': vehicleId,
      'registrationNumber': registrationNumber,
      'type': type,
      'manufacturer': manufacturer,
      'brand': brand,
      'status': status,
      'fuelType': fuelType,
      'year': year,
      'owner': owner,
      'user': user,
      'remark': remark,
      'driverId': driverId,
      'imageUrl': imageUrl,
    };
  }
}

extension VehicleModelX on VehicleModel {
  VehicleEntity toEntity() {
    return VehicleEntity(
      vehicleId: vehicleId,
      registrationNumber: registrationNumber,
      type: type,
      manufacturer: manufacturer,
      brand: brand,
      status: status,
      fuelType: fuelType,
      year: year,
      owner: owner,
      user: user,
      remark: remark,
      driverId: driverId,
      imageUrl: imageUrl,
    );
  }
}
