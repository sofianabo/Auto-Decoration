class IdModelModel {
  bool state;
  String massage;
  int id;

  IdModelModel({this.state, this.massage, this.id});

  IdModelModel.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    massage = json['massage'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['massage'] = this.massage;
    data['id'] = this.id;
    return data;
  }
}
