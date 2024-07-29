class SupCategoryOnlyModel {
  List<SupCategoryOnly> supCategoryonly;

  SupCategoryOnlyModel({ this.supCategoryonly});

  SupCategoryOnlyModel.fromJson(Map<String, dynamic> json) {
    if (json['supCategory'] != null) {
      supCategoryonly = <SupCategoryOnly>[];
      json['supCategory'].forEach((v) {
        supCategoryonly.add(new SupCategoryOnly.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.supCategoryonly != null) {
      data['supCategory'] = this.supCategoryonly.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SupCategoryOnly {
  int id;
  Null deletedAt;
   String supName;
   int categoryId;
   int userId;
   String createdAt;
   String updatedAt;

  SupCategoryOnly(
      { this.id,
           this.deletedAt,
          this.supName,
           this.categoryId,
           this.userId,
           this.createdAt,
           this.updatedAt});

  SupCategoryOnly.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deletedAt = json['deleted_at'];
    supName = json['supName'];
    categoryId = json['categoryId'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['deleted_at'] = this.deletedAt;
    data['supName'] = this.supName;
    data['categoryId'] = this.categoryId;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
