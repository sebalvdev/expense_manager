import 'package:flutter/material.dart';

import 'crud.dart';
import 'task.dart';

class TaskApp extends StatefulWidget {
  const TaskApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TaskAppState createState() => _TaskAppState();
}

class _TaskAppState extends State<TaskApp> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    _fetchTasks();
  }

  Future<void> _fetchTasks() async {
    final data = await dbHelper.getTasks();
    setState(() {
      tasks = data;
    });
  }

  Future<void> _addTask(String title, String description) async {
    final task = Task(title: title, description: description);
    await dbHelper.insertTask(task);
    _fetchTasks();
  }

  Future<void> _deleteTask(int id) async {
    await dbHelper.deleteTask(id);
    _fetchTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager'),
      ),
      body: content(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          newTask(context);
        },
      ),
    );
  }

  Future<dynamic> newTask(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        final titleController = TextEditingController();
        final descriptionController = TextEditingController();

        return AlertDialog(
          title: const Text('New Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: 'Title')),
              TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(labelText: 'Description')),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                if (titleController.text.isNotEmpty &&
                    descriptionController.text.isNotEmpty) {
                  _addTask(titleController.text, descriptionController.text);
                } else {
                  _showSnackbar("debe llesar todos los campos");
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    final snackBar = SnackBar(
      duration: const Duration(seconds: 2),
      content: Text(message),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
      closeIconColor: Colors.amber,
    );
    final materialbanner = MaterialBanner(
      content: Text(message),
      backgroundColor: Colors.red,
      actions: <Widget>[
        TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            },
            child: const Text('message'))
      ],
      leading: const Icon(Icons.import_contacts),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    ScaffoldMessenger.of(context).showMaterialBanner(materialbanner);

    // Agrega duracion al banner para que desaparezca
    Future.delayed(const Duration(seconds: 2), () {
      ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
    });
  }

  ListView content() {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        // ignore: avoid_print
        print(task);
        return ListTile(
          title: Text(task.title),
          subtitle: Row(
            children: [
              Text('${task.id}'),
              Text(task.description),
            ],
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => _deleteTask(task.id!),
          ),
        );
      },
    );
  }
}
