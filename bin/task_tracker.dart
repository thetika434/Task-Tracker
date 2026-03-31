import 'dart:io';
import 'dart:convert';

class Task {
  int id;
  String description;
  String status;
  String createdAt;
  String updatedAt;
  Task({
    required this.id,
    required this.description,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "description": description,
      "status": status,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      description: json['description'],
      status: json['status'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class TaskManager {
  final List<Task> _tasks = [];
  void addTask(String description) {
    final newTask = Task(
      id: _tasks.length + 1,
      description: description,
      status: "todo",
      createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
    );
    _tasks.add(newTask);
    List<Map<String, dynamic>> jsonFormat = _tasks
        .map((task) => task.toJson())
        .toList();
    final file = File('tasks.json');
    file.writeAsStringSync(jsonEncode(jsonFormat));
  }

  void loadTasks() {
    final file = File('tasks.json');
    if (file.existsSync()) {}
  }
}

void main(List<String> arguments) {
  TaskManager taskManager = TaskManager();

  if (arguments.isEmpty) {
    print(
      "error follow this structure : dart run bin/task_tracker.dart <command> [arguments] ",
    );
  } else if (arguments[0] == "add") {
    if (arguments.length < 2) {
      print("error : please provide a description for the task");
    } else {
      final description = arguments[1];
      taskManager.addTask(description);
      print("task added successfully");
    }
  }
}
