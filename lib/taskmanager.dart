import 'package:flutter/material.dart';
import 'package:assignment8/style.dart';

class Task {
  String title, description;
  int daysRequired;

  Task(this.title, this.description, this.daysRequired);
}

class TaskManagerView extends StatefulWidget {
  const TaskManagerView({super.key});

  @override
  State<TaskManagerView> createState() => _TaskManagerViewState();
}

class _TaskManagerViewState extends State<TaskManagerView> {
  List<Task> tasksToDo = [
    Task('Finish Homework', 'Finish the flutter homework of ostad', 1),
    Task('Cleaning House', 'Clean the house', 2),
    Task('Doing Laundry', 'Washing the clothes', 1)
  ];

  addTaskAlertDialog(context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Expanded(
            child: AlertDialog(
              title: const Text('Add Task'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          decoration: appInputDecoration('Title', 10.0, 20.0),
                        ),
                        sizedBox15(),
                        TextField(
                          decoration:
                              appInputDecoration('Description', 30.0, 20.0),
                          maxLines: 5,
                          minLines: 1,
                        ),
                        sizedBox15(),
                        TextField(
                          decoration:
                              appInputDecoration('Days Required', 10.0, 20.0),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Management'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addTaskAlertDialog(context);
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: tasksToDo.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(tasksToDo[index].title),
              subtitle: Text(tasksToDo[index].description),
            );
          }),
    );
  }
}
