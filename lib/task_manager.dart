import 'dart:convert';
import 'dart:io';

import 'package:task_tracker/task.dart';

class TaskManager {
  List<Task> _tasks = [];

  // add TASKS

  void addTask(String description) {
    final newTask = Task(
      id: _tasks.length + 1,
      description: description,
      status: "todo",
      createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
    );
    _tasks.add(newTask);
  }

  // save DATA

  void saveData() {
    List<Map<String, dynamic>> jsonFormat = _tasks
        .map((task) => task.toJson())
        .toList();
    final file = File('tasks.json');
    file.writeAsStringSync(jsonEncode(jsonFormat));
  }

  // load DATA

  void loadTasks() {
    final file = File('tasks.json');
    if (file.existsSync()) {
      String text = file.readAsStringSync();
      final List<dynamic> jsonData = jsonDecode(text);
      _tasks = jsonData
          .map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList();
    }
  }

  // search  TASK
  Task? taskSearch(int id) {
    try {
      return _tasks.firstWhere((e) => e.id == id);
    } catch (e) {
      return null;
    }
  }

  // delete TASK

  bool deleteTasks(int id) {
    final task = taskSearch(id);

    if (task == null) {
      return false;
    }

    _tasks.remove(task);
    return true;
  }

  void displaAllTask() {
    print("\n========= TASKS LIST =========");
    for (var task in _tasks) {
      print("ID: ${task.id} | ${task.description} | Status: ${task.status}");
    }
  }

  void displayDoneTask() {
    print("\n========= DONE TASKS =========");
    for (var task in _tasks) {
      if (task.status == "done") {
        print("ID: ${task.id} | ${task.description} | Status: ${task.status}");
      }
    }
  }

  void displayTodoTask() {
    print("\n========= TODO TASKS =========");
    for (var task in _tasks) {
      if (task.status == "todo") {
        print("ID: ${task.id} | ${task.description} | Status: ${task.status}");
      }
    }
  }

  void displayProgressTask() {
    print("\n========= in-progress TASKS =========");
    for (var task in _tasks) {
      if (task.status == "in-progress") {
        print("ID: ${task.id} | ${task.description} | Status: ${task.status}");
      }
    }
  }
}
