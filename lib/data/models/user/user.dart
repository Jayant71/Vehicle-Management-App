import 'package:vehicle_management_app/domain/entities/auth/user.dart';

class UserModel {
  final String? fullName;
  final String? uid;
  final String? email;
  // final String? imageURL;
  final String? employeeId;
  final String? contactNumber;
  final String? department;
  final String? designation;
  final String role;
  final String? createdAt;
  final String updatedAt;

  UserModel(
      {this.fullName,
      this.uid,
      this.email,
      // this.imageURL,
      this.employeeId,
      this.contactNumber,
      this.designation,
      this.department,
      this.role = 'user',
      this.createdAt,
      this.updatedAt = ''});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullName: json['fullName'],
      uid: json['uid'],
      email: json['email'],
      // imageURL: json['imageURL'],
      employeeId: json['employeeId'],
      contactNumber: json['contactNumber'],
      department: json['department'],
      designation: json['designation'],
      role: json['role'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullName'] = fullName;
    data['uid'] = uid;
    data['email'] = email;
    // data['imageURL'] = imageURL;
    data['employeeId'] = employeeId;
    data['contactNumber'] = contactNumber;
    data['department'] = department;
    data['designation'] = designation;
    data['role'] = role;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

extension UserModelX on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      fullName: fullName,
      uid: uid,
      email: email,
      // imageURL: imageURL,
      employeeId: employeeId,
      contactNumber: contactNumber,
      department: department,
      designation: designation,
      role: role,
    );
  }
}
