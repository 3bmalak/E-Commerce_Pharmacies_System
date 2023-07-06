class userModel {
  late String name;
  late String phone;
  late String email;
  late String uId;

  userModel(
      {required this.name,
      required this.phone,
      required this.email,
      required this.uId});
  userModel.fromJson(Map<String, dynamic>? json) {
    uId = json!['uId'];
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'uId': uId,
    };
  }
}
