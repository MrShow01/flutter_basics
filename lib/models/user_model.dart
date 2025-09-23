class UserModel {
  String? id;
  String? name;
  int? age;
  bool? isFeatured;
  String? email;

  UserModel({this.id, this.name, this.age, this.isFeatured, this.email});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['age'] = age;
    data['isFeatured'] = isFeatured;
    data['email'] = email;
    return data;
  }
}

class Users {
  String? id;
  String? name;
  int? age;
  bool? passed;

  Users({this.id, this.name, this.age, this.passed});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['age'] = age;
    data['passed'] = passed;

    return data;
  }
}
