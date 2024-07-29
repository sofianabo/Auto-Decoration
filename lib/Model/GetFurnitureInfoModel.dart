class GetFurnitureInfoModel {
  bool state;
  String massage;
   List<Models> models;

  GetFurnitureInfoModel({ this.state, this.massage, this.models});

  GetFurnitureInfoModel.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    massage = json['massage'];
    if (json['models'] != null) {
      models = <Models>[];
      json['models'].forEach((v) {
        models.add(new Models.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['massage'] = this.massage;
    if (this.models != null) {
      data['models'] = this.models.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Models {
  int id;
  String modelName;
  double price;

  Models({ this.id, this.modelName, this.price});

  Models.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    modelName = json['modelName'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['modelName'] = this.modelName;
    data['price'] = this.price;
    return data;
  }
}
