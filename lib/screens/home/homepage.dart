import 'package:flutter/material.dart';
import 'package:todolist/blocs/bloc_exports.dart';
import 'package:todolist/models/tasks_model.dart';
import 'package:todolist/screens/home/widget/task_list.dart';
import 'package:todolist/screens/home/widget/add_task_screen.dart';

import '../../blocs/bloc/todo_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _addTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: const AddTaskScreen(),
        ),
      ),
    );
  }

  void _editTask(BuildContext context, Todo task) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: AddTaskScreen(initialTodo: task),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        if (state is TodoLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TodoLoaded) {
          final taskList =
              state.todos.where((todo) => !todo.isCompleted).toList();
          return Scaffold(
            appBar: AppBar(
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: ElevatedButton(
                    onPressed: () => _addTask(context),
                    child: const Text("Add Tasks"),
                  ),
                ),
              ],
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    'Tasks',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Expanded(
                  child: TaskList(
                    taskList: taskList,
                    onEditTask: (task) => _editTask(context, task),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(child: Text('Something went wrong!'));
        }
      },
    );
  }
}
