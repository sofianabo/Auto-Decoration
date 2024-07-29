class add_BEModel {
  add_BEModel({
     this.user,
  });
   User user;

  add_BEModel.fromJson(Map<String, dynamic> json) {
    try {
      user = User.fromJson(json['user']);
    } catch (e) {
      print('user field');
    }
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user'] = user?.toJson();
    return _data;
  }
}

class User {
  User({
     this.username,
  });

  var username;

  User.fromJson(Map<String, dynamic> json) {
    try {
      username = json['userName'];
    } catch (e) {
      print('username');
    }
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    return _data;
  }
}
