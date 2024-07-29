class categoryModl {
   bool state;
   String massege;
   List<Gategory> gategory;

  categoryModl(
      { this.state,  this.massege,  this.gategory});

  categoryModl.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    massege = json['massege'];
    if (json['Gategory'] != null) {
      gategory = <Gategory>[];
      json['Gategory'].forEach((v) {
        gategory.add(new Gategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['massege'] = this.massege;
    if (gategory != null) {
      data['Gategory'] = this.gategory.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Gategory {
   int id;
   String name;

  Gategory({ this.id,  this.name});

  Gategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
