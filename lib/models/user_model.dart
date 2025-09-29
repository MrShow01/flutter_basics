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
  List<int>? grades;

  Users({this.id, this.name, this.age, this.passed, this.grades});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['age'] = age;
    data['passed'] = passed;
    data['grades'] = grades;

    return data;
  }
}
