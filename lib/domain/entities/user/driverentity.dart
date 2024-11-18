class DriverEntity {
  final String driverId;
  final String name;
  final String status;
  final String allocation;
  final String contact;
  final String? altContact;
  final String? altContactRelative;
  final DateTime? dateOfBirth;
  final String? residence;
  final String licenseNumber;
  final String? licenseType;
  final DateTime? licenseIssueDate;
  final DateTime? licenseExpiryDate1;
  final DateTime? licenseExpiryDate2;
  final DateTime? licenseExpiryDate3;

  DriverEntity({
    required this.driverId,
    required this.name,
    required this.status,
    required this.allocation,
    required this.contact,
    this.altContact,
    this.altContactRelative,
    this.dateOfBirth,
    this.residence,
    required this.licenseNumber,
    this.licenseType,
    this.licenseIssueDate,
    this.licenseExpiryDate1,
    this.licenseExpiryDate2,
    this.licenseExpiryDate3,
  });
}
