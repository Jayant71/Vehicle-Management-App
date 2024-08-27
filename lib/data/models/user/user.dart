import 'package:vehicle_management_app/domain/entities/auth/user.dart';

class UserModel {
  String? fullName;
  String? uid;
  String? email;
  // String? imageURL;
  String? employeeId;
  String? contactNumber;
  String? department;
  String? designation;
  String role = 'user';
  String? createdAt;
  String updatedAt = ' ';

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
      this.updatedAt = ' '});

  UserModel.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    uid = json['uid'];
    email = json['email'];
    // imageURL = json['imageURL'];
    employeeId = json['employeeId'];
    contactNumber = json['contactNumber'];
    designation = json['designation'];
    department = json['department'];
    role = json['role'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
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
