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

  UserModel.fromJson(Map<String, dynamic> data) {
    fullName = data['name'];
    email = data['email'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': fullName,
      'email': email,
      'uid': uid,
      'imageURL': imageURL,
      'employeeId': employeeId,
      'contactNumber': contactNumber,
      'department': department,
      'role': role
    };
  }
}

extension UserModelX on UserModel {
  UserEntity toEntity() {
    return UserEntity(
        email: email,
        uid: uid,
        fullName: fullName,
        imageURL: imageURL,
        employeeId: employeeId,
        contactNumber: contactNumber,
        department: department,
        role: role);
  }
}
