import 'package:vehicle_management_app/domain/entities/user/driverentity.dart';

class DriverModel {
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
      dateOfBirth: json['DDOB'] != null ? DateTime.parse(json['DDOB']) : null,
      residence: json['DRESIDE'],
      licenseNumber: json['LICNO'] ?? '',
      licenseType: json['LICTYPE'],
      licenseIssueDate:
          json['LISSUEDT'] != null ? DateTime.parse(json['LISSUEDT']) : null,
      licenseExpiryDate1:
          json['LEXPDT1'] != null ? DateTime.parse(json['LEXPDT1']) : null,
      licenseExpiryDate2:
          json['LEXPDT2'] != null ? DateTime.parse(json['LEXPDT2']) : null,
      licenseExpiryDate3:
          json['LEXPDT3'] != null ? DateTime.parse(json['LEXPDT3']) : null,
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
      'DDOB': dateOfBirth?.toIso8601String(),
      'DRESIDE': residence,
      'LICNO': licenseNumber,
      'LICTYPE': licenseType,
      'LISSUEDT': licenseIssueDate?.toIso8601String(),
      'LEXPDT1': licenseExpiryDate1?.toIso8601String(),
      'LEXPDT2': licenseExpiryDate2?.toIso8601String(),
      'LEXPDT3': licenseExpiryDate3?.toIso8601String(),
    };
  }
}

extension DriverModelX on DriverModel {
  DriverEntity toEntity() {
    return DriverEntity(
      driverId: driverId,
      name: name,
      status: status,
      allocation: allocation,
      contact: contact,
      altContact: altContact,
      altContactRelative: altContactRelative,
      dateOfBirth: dateOfBirth,
      residence: residence,
      licenseNumber: licenseNumber,
      licenseType: licenseType,
      licenseIssueDate: licenseIssueDate,
      licenseExpiryDate1: licenseExpiryDate1,
      licenseExpiryDate2: licenseExpiryDate2,
      licenseExpiryDate3: licenseExpiryDate3,
    );
  }
}
