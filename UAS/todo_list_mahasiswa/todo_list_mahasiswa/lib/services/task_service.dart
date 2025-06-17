import 'package:flutter/foundation.dart';
import 'package:firebase_database/firebase_database.dart';
import '../models/task.dart';

class TaskService extends ChangeNotifier {
  final DatabaseReference _database = FirebaseDatabase.instance.ref();
  List<Task> _tasks = [];
  
  List<Task> get tasks => _tasks;

  // Initialize and listen to Firebase changes
  void initializeListener() {
    _database.child('tasks').onValue.listen((event) {
      final data = event.snapshot.value;
      if (data != null && data is Map) {
        _tasks = [];
        data.forEach((key, value) {
          if (value is Map<String, dynamic>) {
            _tasks.add(Task.fromMap(Map<String, dynamic>.from(value)));
          }
        });
        // Sort tasks by deadline
        _tasks.sort((a, b) => a.deadline.compareTo(b.deadline));
        notifyListeners();
      } else {
        _tasks = [];
        notifyListeners();
      }
    });
  }

  // Add new task
  Future<void> addTask(Task task) async {
    try {
      await _database.child('tasks').child(task.id).set(task.toMap());
    } catch (e) {
      print('Error adding task: $e');
    }
  }

  // Update existing task
  Future<void> updateTask(Task task) async {
    try {
      await _database.child('tasks').child(task.id).update(task.toMap());
    } catch (e) {
      print('Error updating task: $e');
    }
  }

  // Delete task
  Future<void> deleteTask(String taskId) async {
    try {
      await _database.child('tasks').child(taskId).remove();
    } catch (e) {
      print('Error deleting task: $e');
    }
  }

  // Toggle task completion
  Future<void> toggleTaskComplete(String taskId) async {
    try {
      final taskIndex = _tasks.indexWhere((task) => task.id == taskId);
      if (taskIndex != -1) {
        final task = _tasks[taskIndex];
        final updatedTask = task.copyWith(isCompleted: !task.isCompleted);
        await updateTask(updatedTask);
      }
    } catch (e) {
      print('Error toggling task completion: $e');
    }
  }

  // Get task by ID
  Task? getTaskById(String taskId) {
    try {
      return _tasks.firstWhere((task) => task.id == taskId);
    } catch (e) {
      return null;
    }
  }

  // Get tasks by category
  List<Task> getTasksByCategory(String category) {
    if (category == 'All') {
      return _tasks;
    }
    return _tasks.where((task) => task.category == category).toList();
  }

  // Get completed tasks
  List<Task> getCompletedTasks() {
    return _tasks.where((task) => task.isCompleted).toList();
  }

  // Get pending tasks
  List<Task> getPendingTasks() {
    return _tasks.where((task) => !task.isCompleted).toList();
  }

  // Get overdue tasks
  List<Task> getOverdueTasks() {
    final now = DateTime.now();
    return _tasks.where((task) => 
        !task.isCompleted && task.deadline.isBefore(now)).toList();
  }
}

