import 'package:hive_ce/hive.dart';

//part 'hive_example.g.dart';

@HiveType(typeId: 0)
class Person extends HiveObject {
  Person({required this.name, required this.age, required this.friends});

  @HiveField(0)
  String name;

  @HiveField(1)
  int age;

  @HiveField(2)
  List<String> friends;
}
