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
    var getFormData = {};
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Expanded(
            child: AlertDialog(
              title: const Text('Add Task'),
              content: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      onChanged: (value) {
                        getFormData['title'] = value;
                      },
                      decoration: appInputDecoration('Title', 10.0, 20.0),
                    ),
                    sizedBox15(),
                    TextField(
                      onChanged: (value) {
                        getFormData['description'] = value;
                      },
                      decoration: appInputDecoration('Description', 30.0, 20.0),
                      maxLines: 5,
                      minLines: 1,
                    ),
                    sizedBox15(),
                    TextField(
                      onChanged: (value) {
                        getFormData['daysRequired'] = int.parse(value);
                      },
                      decoration:
                          appInputDecoration('Days Required', 10.0, 20.0),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {});
                    tasksToDo.add(Task(
                        getFormData['title'],
                        getFormData['description'],
                        getFormData['daysRequired']));
                    Navigator.of(context).pop();
                  },
                  child: const Text('Save'),
                )
              ],
            ),
          );
        });
  }

  removeItem(index) {
    tasksToDo.remove(tasksToDo[index]);
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
              onLongPress: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Task Details',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: double.infinity,
                              height: 20.0,
                            ),
                            Text('Title: ${tasksToDo[index].title}'),
                            Text(
                                'Description: ${tasksToDo[index].description}'),
                            Text(
                                'Days Required: ${tasksToDo[index].daysRequired}'),
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.blue,
                              ),
                              onPressed: () {
                                setState(() {
                                  removeItem(index);
                                  Navigator.of(context).pop();
                                });
                              },
                              child: const Text(
                                'Delete',
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      );
                    });
              },
              title: Text(tasksToDo[index].title),
              subtitle: Text(tasksToDo[index].description),
            );
          }),
    );
  }
}
