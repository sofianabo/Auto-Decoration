class BranchEngineersModel {
  bool stat;
  String massage;
  List<User> user;

  BranchEngineersModel({this.stat, this.massage, this.user});

  BranchEngineersModel.fromJson(Map<String, dynamic> json) {
    stat = json['stat'];
    massage = json['massage'];
    if (json['user'] != null) {
      user = new List<User>();
      json['user'].forEach((v) {
        user.add(new User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stat'] = this.stat;
    data['massage'] = this.massage;
    if (this.user != null) {
      data['user'] = this.user.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  String userName;
  String email;
  String address;
  String name;

  User({this.userName, this.email, this.address, this.name});

  User.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    email = json['email'];
    address = json['address'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['address'] = this.address;
    data['name'] = this.name;
    return data;
  }
}
