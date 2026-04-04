import 'package:task_tracker/task_manager.dart';

void main(List<String> arguments) {
  TaskManager taskManager = TaskManager();
  taskManager.loadTasks();

  if (arguments.isEmpty) {
    print(
      "error follow this structure : dart run bin/task_tracker.dart <command> [arguments] ",
    );

    // add tasks
  } else if (arguments[0] == "add") {
    if (arguments.length < 2) {
      print("error : please provide a description for the task");
    } else {
      final description = arguments[1];
      taskManager.addTask(description);

      print("task added successfully ");
      taskManager.saveData();
    }

    // update tasks
  } else if (arguments[0] == 'update') {
    if (arguments.length < 3) {
      print('⚠️ oups  you probably missing the ID or the updated description');
    } else {
      try {
        int id = int.parse(arguments[1]);
        String newDescription = arguments[2];
        final task = taskManager.taskSearch(
          id,
        ); // get the task by the ID provided
        if (task == null) {
          print("the task is not found");
        } else {
          task.update(newDescription);
          taskManager.saveData();
        }
      } catch (e) {
        print(' the ID must be an integer');
      }
    }
  }
  // delete taks
  else if (arguments[0] == 'delete') {
    if (arguments.length < 2) {
      print('error: please provide the task ID');
    } else {
      try {
        int id = int.parse(arguments[1]);
        final isDeleted = taskManager.deleteTasks(id);

        if (isDeleted) {
          taskManager.saveData();
          print('task deleted successfully');
        } else {
          print('the task is not found');
        }
      } catch (e) {
        print('enter an integer as ID');
      }
    }
  }
  // change status
  else if (arguments[0] == "mark-in-progress" || arguments[0] == "mark-done") {
    if (arguments.length < 2) {
      print(' ⛔ oups you probably miss something ');
    } else {
      try {
        int id = int.parse(arguments[1]);
        String status;
        if (arguments[0] == "mark-in-progress") {
          status = "in-progress";
        } else {
          status = "done";
        }

        final task = taskManager.taskSearch(id);
        if (task == null) {
          print("the task is not found");
        } else {
          task.statusChange(status);
          taskManager.saveData();
        }
      } catch (e) {
        print('enter an integer as ID');
      }
    }
  }
  // display all tasks
  else if (arguments[0] == "list") {
    if (arguments.length < 2) {
      taskManager.displaAllTask();
    } else {
      if (arguments[1] == "done") {
        taskManager.displayDoneTask();
      }
      if (arguments[1] == "todo") {
        taskManager.displayTodoTask();
      }
      if (arguments[1] == "in-progress") {
        taskManager.displayProgressTask();
      }
    }
  }
}
