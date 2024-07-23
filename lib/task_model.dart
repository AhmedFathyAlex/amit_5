// ignore_for_file: public_member_api_docs, sort_constructors_first
class TaskModel {
  late String name;
  late int isDone;
  late int id;

  TaskModel({
    required this.name,
    required this.isDone,
    required this.id,
  });

  TaskModel.fromJson(Map json){
    name = json['name'];
    id = json['id'];
    isDone = json['isDone'];
  }

}
