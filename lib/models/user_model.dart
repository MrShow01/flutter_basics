class UserModel {
  String? id;
  String? name;
  int? age;
  bool? isFeatured;
  String? email;

  UserModel({this.id, this.name, this.age, this.isFeatured, this.email});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = name;
    data['id'] = age;
    data['title'] = isFeatured;
    data['body'] = email;
    return data;
  }
}
