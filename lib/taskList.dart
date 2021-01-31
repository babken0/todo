import 'package:flutter/cupertino.dart';

import 'task.dart';

class TaskList{
  String _title;
  final List<Task> tasks = [];


  String get title => _title;

  set title(String value) {
    _title = value;
  }

  void addTask({task}){
    this.tasks.add(task);
  }

  void delete({index}){
    tasks.removeAt(index);
  }
}