import 'dart:convert';
import 'dart:io';


import 'package:todo_list/models/todo_item.dart';

class ToDoService {
  static final ToDoService _instance = ToDoService._internal();
  static const fileName = "file.json";

  factory ToDoService() => _instance;

  ToDoService._internal();

  List<ToDoItem> items = [];

  // Future<void> readFile() async {
  //   Directory dir = await getApplicationDocumentsDirectory();
  //   var jsonFile = File("${dir.path}/$fileName");
  //   if (await jsonFile.exists()) {
  //     List<dynamic> content = json.decode(jsonFile.readAsStringSync());
  //     items.addAll(content.map((e) => ToDoItem.fromJson(e)));
  //   }
  // }
}
