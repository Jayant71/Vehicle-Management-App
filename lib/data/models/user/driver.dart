import 'package:vehicle_management_app/domain/entities/user/driverentity.dart';

class DriverModel {
  final String driverId;
  final String name;
  final String status;
  final String allocation;
  final String contact;
  final String? altContact;
  final String? altContactRelative;
  final String? dateOfBirth;
  final String? residence;
  final String licenseNumber;
  final String? licenseType;
  final String? role;
  final String? licenseIssueDate;
  final String? licenseExpiryDate1;
  final String? licenseExpiryDate2;
  final String? licenseExpiryDate3;

  DriverModel({
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
    this.role = 'driver',
    this.licenseIssueDate,
    this.licenseExpiryDate1,
    this.licenseExpiryDate2,
    this.licenseExpiryDate3,
  });

  factory DriverModel.fromJson(Map<String, dynamic> json) {
    return DriverModel(
      driverId: json['DID'],
      name: json['DRVNAME'],
      status: json['DSTATUS'],
      allocation: json['DALLOCATION'],
      contact: json['CONTACT'],
      altContact: json['ALTCONTACT'],
      altContactRelative: json['ALTCONRELATIVE'],
      dateOfBirth: json['DDOB'],
      residence: json['DRESIDE'],
      role: json['ROLE'],
      licenseNumber: json['LICNO'] ?? '',
      licenseType: json['LICTYPE'],
      licenseIssueDate: json['LISSUEDT'],
      licenseExpiryDate1: json['LEXPDT1'],
      licenseExpiryDate2: json['LEXPDT2'],
      licenseExpiryDate3: json['LEXPDT3'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'DID': driverId,
      'DRVNAME': name,
      'DSTATUS': status,
      'DALLOCATION': allocation,
      'CONTACT': contact,
      'ALTCONTACT': altContact,
      'ALTCONRELATIVE': altContactRelative,
      'DDOB': dateOfBirth?.toString(),
      'DRESIDE': residence,
      'LICNO': licenseNumber,
      'LICTYPE': licenseType,
      'ROLE': role,
      'LISSUEDT': licenseIssueDate?.toString(),
      'LEXPDT1': licenseExpiryDate1?.toString(),
      'LEXPDT2': licenseExpiryDate2?.toString(),
      'LEXPDT3': licenseExpiryDate3?.toString(),
    };
  }
}

// extension DriverModelX on DriverModel {
//   DriverEntity toEntity() {
//     return DriverEntity(
//       driverId: driverId,
//       name: name,
//       status: status,
//       allocation: allocation,
//       contact: contact,
//       altContact: altContact,
//       altContactRelative: altContactRelative,
//       dateOfBirth: dateOfBirth != null ? DateTime.parse(dateOfBirth) : null,
//       residence: residence,
//       licenseNumber: licenseNumber,
//       licenseType: licenseType,
//       licenseIssueDate: licenseIssueDate != null ? DateTime.parse(licenseIssueDate) : null,
//       licenseExpiryDate1: licenseExpiryDate1 != null ? DateTime.parse(licenseExpiryDate1) : null,
//       licenseExpiryDate2: licenseExpiryDate2 != null ? DateTime.parse(licenseExpiryDate2) : null,
//       licenseExpiryDate3: licenseExpiryDate3 != null ? DateTime.parse(licenseExpiryDate3) : null,
//     );
//   }
// }
