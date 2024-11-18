// class VehicleEntity {
//   String vehicleId;
//   String registrationNumber;
//   String name;
//   String brand;
//   //  String? imageUrl;
//   String driverId;
//   String availablity;

//   VehicleEntity({
//     required this.vehicleId,
//     required this.name,
//     required this.brand,
//     // required this.imageUrl,
//     required this.driverId,
//     required this.registrationNumber,
//     required this.availablity,
//   });
// }

class VehicleEntity {
  final String vehicleId;
  final String registrationNumber;
  final String type;
  final String manufacturer;
  final String brand;
  final String status; // Replaces "availability"
  final String fuelType;
  final int? year;
  final String? owner;
  final String? user;
  final String? remark; // Optional remark field
  final String driverId;
  final String imageUrl;

  VehicleEntity({
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
}
