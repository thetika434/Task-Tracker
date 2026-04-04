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

  // update tasks

  void update(String description) {
    this.description = description;
    updatedAt = DateTime.now().toIso8601String();
    print("task updated with succeed");
  }

  // change status

  void statusChange(String status) {
    this.status = status;
    updatedAt = DateTime.now().toIso8601String();
    print("task's status changed with succed ");
  }
}
