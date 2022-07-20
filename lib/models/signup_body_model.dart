class SignupBody {
  String name;
  String email;
  String password;
  String phone;
  SignupBody(
      {required this.name,
      required this.email,
      required this.password,
      required this.phone});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["username"] = this.name;
    data["email"] = this.email;
    data["password"] = this.password;
    data["phone_number"] = this.phone;
    return data;
  }
}
