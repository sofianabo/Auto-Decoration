class EngineerRoomsCompanyModel {
  bool stat;
  String massege;
  List<Room> room;

  EngineerRoomsCompanyModel({ this.stat, this.massege, this.room});

  EngineerRoomsCompanyModel.fromJson(Map<String, dynamic> json) {
    stat = json['stat'];
    massege = json['massege'];
    if (json['room'] != null) {
      room = <Room>[];
      json['room'].forEach((v) {
        room.add(new Room.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stat'] = this.stat;
    data['massege'] = this.massege;
    if (this.room != null) {
      data['room'] = this.room.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Room {
  String roomModelName;
  int id;
  double price;

  Room({ this.roomModelName, this.id, this.price});

  Room.fromJson(Map<String, dynamic> json) {
    roomModelName = json['roomModelName'];
    id = json['id'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roomModelName'] = this.roomModelName;
    data['id'] = this.id;
    data['price'] = this.price;
    return data;
  }
}
