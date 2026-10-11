import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];

  // Reference the opened box
  final _myBox = Hive.box('mybox');

  // Run on very first app run
  void createInitialData() {
    toDoList = [
      ["Make tutorial", false],
      ["Do exercise", false],
    ];
  }

  // Load data from box
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  // Update data in box
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}