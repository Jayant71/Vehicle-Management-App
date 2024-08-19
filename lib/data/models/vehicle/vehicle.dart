import 'package:vehicle_management_app/data/models/vehicle/maintenance_record.dart';
import 'package:vehicle_management_app/data/models/vehicle/refueling_record.dart';

class VehicleModel {
  final String id;
  final String name;
  final String brand;
  final String model;
  final String color;
  final String price;
  final String image;
  final List<MaintenanceRecord> maintenanceHistory;
  final List<RefuelingRecord> refuelingHistory;

  VehicleModel({
    required this.id,
    required this.name,
    required this.brand,
    required this.model,
    required this.color,
    required this.price,
    required this.image,
    this.maintenanceHistory = const [],
    this.refuelingHistory = const [],
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      id: json['id'],
      name: json['name'],
      brand: json['brand'],
      model: json['model'],
      color: json['color'],
      price: json['price'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'brand': brand,
      'model': model,
      'color': color,
      'price': price,
      'image': image,
    };
  }
}

extension VehicleModelX on VehicleModel {
  VehicleModel toEntity() {
    return VehicleModel(
      id: id,
      name: name,
      brand: brand,
      model: model,
      color: color,
      price: price,
      image: image,
      maintenanceHistory: maintenanceHistory,
      refuelingHistory: refuelingHistory,
    );
  }
}
