class UserModel {
  int id;
  String firstName;
  String email;
  String phone;
  String dateJoined;
  bool isPhoneVerified;
  bool isMailVerified;
  int orderCount;
  String? lastName;
  String? address;

  UserModel(
      {required this.id,
      required this.firstName,
      required this.email,
      required this.phone,
      required this.dateJoined,
      required this.isPhoneVerified,
      required this.isMailVerified,
      required this.orderCount,
      this.lastName,
      this.address});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      email: json["email"],
      phone: json["phone_number"],
      dateJoined: json["date_joined"],
      address: json["address"],
      orderCount: json["order_count"],
      isMailVerified: json["mail_is_verified"],
      isPhoneVerified: json["is_phone_veryfied"],
    );
  }
}
