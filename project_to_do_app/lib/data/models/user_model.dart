class UserModel {
  String? sId;
  String? email;
  String? firstName;
  String? lastName;
  String? mobile;
  String? createdDate;

  UserModel(
      {this.sId,
        this.email,
        this.firstName,
        this.lastName,
        this.mobile,
        this.createdDate});

  UserModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    mobile = json['mobile'];
    createdDate = json['createdDate'];
  }
}