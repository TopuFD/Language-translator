import 'package:hive/hive.dart';
part 'my_data_model.g.dart';

@HiveType(typeId: 0)
class DataModel extends HiveObject {

  @HiveField(0)
  String title;
  @HiveField(1)
  String description;

  DataModel({required this.title, required this.description});
}
