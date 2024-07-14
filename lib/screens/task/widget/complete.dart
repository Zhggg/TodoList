import 'package:flutter/material.dart';
import 'package:todolist/models/tasks_model.dart';

class CompletedTasksPage extends StatelessWidget {
  final List<Todo> completedItems;

  const CompletedTasksPage({super.key, required this.completedItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Completed Tasks'),
      ),
      body: ListView.builder(
        itemCount: completedItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(completedItems[index].title),
            leading: const Icon(Icons.done, color: Colors.green),
          );
        },
      ),
    );
  }
}
