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

class TaskManager {}

void main(List<String> arguments) {
  // print('Hello world: ${task_tracker.calculate()}!');
}
