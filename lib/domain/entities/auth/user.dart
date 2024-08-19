class UserEntity {
  String? fullName;
  String? uid;
  String? email;
  String? imageURL;
  String? employeeId;
  String? contactNumber;
  String? department;
  String role = 'user';

  UserEntity({
    this.fullName,
    this.uid,
    this.email,
    this.imageURL,
    this.employeeId,
    this.contactNumber,
    this.department,
    this.role = 'user',
  });
}
