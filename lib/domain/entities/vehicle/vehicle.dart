class VehicleEntity {
  String vehicleId;
  String registrationNumber;
  String name;
  String brand;
  //  String? imageUrl;
  String driverId;
  String availablity;

  VehicleEntity({
    required this.vehicleId,
    required this.name,
    required this.brand,
    // required this.imageUrl,
    required this.driverId,
    required this.registrationNumber,
    required this.availablity,
  });
}
