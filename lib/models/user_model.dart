class UserModel {
  int id;
  String firstName;
  String lastName;
  String email;
  String phone;
  String dateJoined;
  int? orderCount;

  UserModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phone,
      required this.dateJoined,
      this.orderCount});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      email: json["email"],
      phone: json["phone_number"],
      dateJoined: json["date_joined"],
    );
  }
}
