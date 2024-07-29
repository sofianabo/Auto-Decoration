class UserInfoModel {
 bool stat;
  String massage;
  String token;
  User user;

  UserInfoModel({ this.stat, this.massage,  this.token, this.user});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    stat = json['stat'];
    massage = json['massage'];
    token = json['token'];
    user = (json['user'] != null ? new User.fromJson(json['user']) : null);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stat'] = this.stat;
    data['massage'] = this.massage;
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
   String name;
    String email;
    String address;
    String userName;
    String roll;

  User({ this.name, this.email, this.address, this.userName, this.roll});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    address = json['address'];
    userName = json['userName'];
    roll = json['roll'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['address'] = this.address;
    data['userName'] = this.userName;
    data['roll'] = this.roll;
    return data;
  }
}
