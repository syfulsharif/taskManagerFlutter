import 'package:flutter/material.dart';
import 'package:assignment8/style.dart';

class Tasks {
  String title, description;
  int daysRequired;
  Tasks(this.title, this.description, this.daysRequired);
}

class TaskManagerView extends StatefulWidget {
  const TaskManagerView({super.key});

  @override
  State<TaskManagerView> createState() => _TaskManagerViewState();
}

class _TaskManagerViewState extends State<TaskManagerView> {
  List<Tasks> tasksToDo = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Management'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
