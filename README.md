# Task Tracker CLI

A simple command-line interface (CLI) application to track and manage your tasks. Built with Dart, this project helps you organize what you need to do, what you're currently working on, and what you've completed.

## Features

 **Core Functionality:**
-  Add new tasks
-  Update existing tasks
-  Delete tasks
-  Mark tasks as "in progress" or "done"
-  List all tasks
-  Filter tasks by status (todo, in-progress, done)
-  Persistent storage using JSON
-  Automatic timestamps for task creation and updates

## Requirements

- **Dart SDK** (version 2.12 or higher)
- No external packages required - uses only Dart's native libraries

## Installation

### 1. Clone or Download the Project

```bash
git clone <your-repository-url>
cd task_trackers
```

### 2. Verify Dart Installation

```bash
dart --version
```

If Dart is not installed, download it from [dart.dev](https://dart.dev/get-dart)

### 3. Project Structure

```
task_trackers/
├── bin/
│   └── task_tracker.dart    # Main application file
├── pubspec.yaml             # Dart project configuration
├── tasks.json              # Auto-generated task storage (created on first run)
└── README.md               # This file
```

## Usage

All commands follow this pattern:

```bash
dart run bin/task_tracker.dart <command> [arguments]
```

### Add a New Task

```bash
dart run bin/task_tracker.dart add "Buy groceries"
```

**Output:**
```
Task added successfully (ID: 1)
```

### List All Tasks

```bash
dart run bin/task_tracker.dart list
```

**Output:**
```
ID: 1 | Buy groceries | Status: todo
ID: 2 | Write documentation | Status: in-progress
ID: 3 | Deploy application | Status: done
```

### List Tasks by Status

**List only TODO tasks:**
```bash
dart run bin/task_tracker.dart list todo
```

**List only IN-PROGRESS tasks:**
```bash
dart run bin/task_tracker.dart list in-progress
```

**List only DONE tasks:**
```bash
dart run bin/task_tracker.dart list done
```

### Update a Task

```bash
dart run bin/task_tracker.dart update 1 "Buy groceries and cook dinner"
```

**Output:**
```
Task 1 updated successfully
```

### Delete a Task

```bash
dart run bin/task_tracker.dart delete 1
```

**Output:**
```
Task 1 deleted successfully
```

### Mark Task as In Progress

```bash
dart run bin/task_tracker.dart mark-in-progress 1
```

**Output:**
```
Task 1 marked as in-progress
```

### Mark Task as Done

```bash
dart run bin/task_tracker.dart mark-done 1
```

**Output:**
```
Task 1 marked as done
```

## Task Properties

Each task contains the following properties:

| Property | Type | Description |
|----------|------|-------------|
| `id` | Integer | Unique identifier for the task |
| `description` | String | Short description of the task |
| `status` | String | Current status: `todo`, `in-progress`, or `done` |
| `createdAt` | DateTime | Timestamp when the task was created |
| `updatedAt` | DateTime | Timestamp when the task was last modified |

## Data Storage

Tasks are stored in a `tasks.json` file in the project root directory. The file is created automatically on first use.

**Example `tasks.json`:**

```json
[
  {
    "id": 1,
    "description": "Buy groceries",
    "status": "todo",
    "createdAt": "2024-03-27T10:30:00.000Z",
    "updatedAt": "2024-03-27T10:30:00.000Z"
  },
  {
    "id": 2,
    "description": "Write documentation",
    "status": "in-progress",
    "createdAt": "2024-03-27T11:00:00.000Z",
    "updatedAt": "2024-03-27T12:15:00.000Z"
  }
]
```

## Command Reference

| Command | Arguments | Description | Example |
|---------|-----------|-------------|---------|
| `add` | `<description>` | Add a new task | `dart run bin/task_tracker.dart add "Task name"` |
| `list` | `[status]` | List all tasks or filter by status | `dart run bin/task_tracker.dart list done` |
| `update` | `<id> <description>` | Update task description | `dart run bin/task_tracker.dart update 1 "New description"` |
| `delete` | `<id>` | Delete a task | `dart run bin/task_tracker.dart delete 1` |
| `mark-in-progress` | `<id>` | Mark task as in progress | `dart run bin/task_tracker.dart mark-in-progress 1` |
| `mark-done` | `<id>` | Mark task as done | `dart run bin/task_tracker.dart mark-done 1` |

## Error Handling

The application handles common errors gracefully:

- ❌ **Missing arguments:** Provides usage instructions
- ❌ **Invalid task ID:** Notifies that task was not found
- ❌ **Unknown commands:** Displays error message
- ❌ **Missing JSON file:** Automatically creates it

## Development

### Object-Oriented Design

The project uses OOP principles with two main classes:

1. **`Task`** - Represents a single task with properties and methods for JSON serialization
2. **`TaskManager`** - Manages the collection of tasks and handles file I/O operations

### Code Structure

```dart
// Task class handles individual task data
class Task {
  int id;
  String description;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  
  // Methods: toJson(), fromJson(), toString()
}

// TaskManager handles all business logic
class TaskManager {
  List<Task> tasks;
  
  // Methods: loadTasks(), saveTasks(), addTask(), 
  // listTasks(), updateTask(), deleteTask(), etc.
}
```

## Contributing

This is a learning project, but suggestions and improvements are welcome!

## License

This project is open source and available for educational purposes.

## Acknowledgments

Project inspired by [roadmap.sh](https://roadmap.sh/projects/task-tracker) backend project challenges.

---

**Happy Task Tracking! **