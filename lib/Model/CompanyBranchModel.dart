class CBmodel {
   bool stat;
   String massage;
   List<company> user;

  CBmodel({ this.stat,  this.massage,  this.user});

  CBmodel.fromJson(Map<String, dynamic> json) {
    stat = json['stat'];
    massage = json['massage'];
    if (json['user'] != null) {
      user = <company>[];
      json['user'].forEach((v) {
        user.add(company.fromJson(v));
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

class company {
   String userName;
   String email;
   String address;
   String name;

  company(
      { this.userName,
       this.email,
       this.address,
       this.name});

  company.fromJson(Map<String, dynamic> json) {
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
