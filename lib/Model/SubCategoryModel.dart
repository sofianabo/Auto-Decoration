class SubCategoryModel {
   bool states;
   String massege;
   List<SupCategory> supCategory;

  SubCategoryModel(
      { this.states,  this.massege,  this.supCategory});

  SubCategoryModel.fromJson(Map<String, dynamic> json) {
    states = json['states'];
    massege = json['massege'];
    if (json['supCategory'] != null) {
      supCategory = <SupCategory>[];
      json['supCategory'].forEach((v) {
        supCategory.add(SupCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['states'] = states;
    data['massege'] = massege;
    if (supCategory != null) {
      data['supCategory'] = supCategory.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SupCategory {
   String supName;
   int id;

  SupCategory({ this.supName,  this.id});

  SupCategory.fromJson(Map<String, dynamic> json) {
    supName = json['supName'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['supName'] = supName;
    data['id'] = id;
    return data;
  }
}
