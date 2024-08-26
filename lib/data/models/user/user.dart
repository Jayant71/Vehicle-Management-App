import 'package:vehicle_management_app/domain/entities/auth/user.dart';

class UserModel {
  String? fullName;
  String? uid;
  String? email;
  String? imageURL;
  String? employeeId;
  String? contactNumber;
  String? department;
  String role = 'user';

  UserModel(
      {this.fullName,
      this.uid,
      this.email,
      this.imageURL,
      this.employeeId,
      this.contactNumber,
      this.department,
      this.role = 'user'});

  UserModel.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    uid = json['uid'];
    email = json['email'];
    imageURL = json['imageURL'];
    employeeId = json['employeeId'];
    contactNumber = json['contactNumber'];
    department = json['department'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullName'] = fullName;
    data['uid'] = uid;
    data['email'] = email;
    data['imageURL'] = imageURL;
    data['employeeId'] = employeeId;
    data['contactNumber'] = contactNumber;
    data['department'] = department;
    data['role'] = role;
    return data;
  }
}

extension UserModelX on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      fullName: fullName,
      uid: uid,
      email: email,
      imageURL: imageURL,
      employeeId: employeeId,
      contactNumber: contactNumber,
      department: department,
      role: role,
    );
  }
}
