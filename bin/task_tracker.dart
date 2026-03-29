class Task {
  int id;
  String description;
  String status;
  String createAt;
  String updateAt;
  Task({
    required this.id,
    required this.description,
    required this.status,
    required this.createAt,
    required this.updateAt,
  });

  Map<String, dynamic> tojson() {
    return {
      "id": id,
      "description": description,
      "status": status,
      "createAt": createAt,
      "updateAt": updateAt,
    };
  }
}

class TaskManager {
final List<Task> _tasks = [];
void addTask(String description){
  final newTask=Task(id: _tasks.length+1, description: description, status: "pending", createAt: DateTime.now().toIso8601String(), updateAt: DateTime.now().toIso8601String());
}

}

void main(List<String> arguments) {
  TaskManager taskManager=TaskManager();

  if (arguments.isEmpty) {
    print(
      "error follow this structure : dart run bin/task_tracker.dart <command> [arguments] ",
    );
  }  else if(arguments[0]=="add"){
    if(arguments.length<2){
      print("error : please provide a description for the task");
    }else{
      final description=arguments[1];
      taskManager.addTask(description);
      print("task added successfully");
    }
      
  }
}
