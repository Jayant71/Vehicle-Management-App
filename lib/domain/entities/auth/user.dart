class UserEntity {
  String? fullName;
  String? uid;
  String? email;
  // String? imageURL;
  String? employeeId;
  String? contactNumber;
  String? department;
  String? designation;
  String role = 'user';

  UserEntity({
    this.fullName,
    this.uid,
    this.email,
    // this.imageURL,
    this.employeeId,
    this.contactNumber,
    this.department,
    this.designation,
    this.role = 'user',
  });
}
