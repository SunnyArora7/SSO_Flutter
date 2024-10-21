class HomeModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  dynamic image;
  String? createdAt;

  HomeModel(
      {this.id, this.name, this.email, this.phone, this.image, this.createdAt});

  HomeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['image'] = image;
    data['created_at'] = createdAt;
    return data;
  }
}
