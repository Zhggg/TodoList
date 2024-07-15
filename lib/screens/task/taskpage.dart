import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/blocs/todo_bloc/todo_bloc.dart';
import 'package:todolist/blocs/todo_bloc/todo_state.dart';
import 'package:todolist/blocs/todo_bloc/todo_event.dart';
import 'package:todolist/common/widgets/icon_button.dart';
import 'package:todolist/utils/constants/color.dart';

import '../../models/tasks_model.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TodoBloc>().add(LoadTodos());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Tasks',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          bottom: const TabBar(
            indicatorColor: AppColors.primaryColor,
            labelColor: AppColors.primaryColor,
            tabs: [
              Tab(icon: Icon(Icons.list), text: 'Todo List'),
              Tab(icon: Icon(Icons.done), text: 'Complete'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            BlocBuilder<TodoBloc, TodoState>(
              builder: (context, state) {
                if (state is TodoLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is TodoLoaded) {
                  final todoItems =
                      state.todos.where((todo) => !todo.isCompleted).toList();

                  return ListView.builder(
                    itemCount: todoItems.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(todoItems[index].title),
                        trailing: SizedBox(
                          width: 100.0,
                          child: Row(
                            children: [
                              CustomIconButton(
                                onPressed: () {
                                  _showDeleteConfirmationDialog(
                                      todoItems[index]);
                                },
                                icon: Icons.cancel_outlined,
                                iconColor: AppColors.error,
                              ),
                              CustomIconButton(
                                onPressed: () {
                                  context.read<TodoBloc>().add(UpdateTodo(
                                        todo: todoItems[index]
                                            .copyWith(isCompleted: true),
                                      ));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          '${todoItems[index].title} Completed Sucessfully'),
                                      backgroundColor: AppColors.success,
                                      duration: const Duration(seconds: 2),
                                    ),
                                  );
                                },
                                icon: Icons.done,
                                iconColor: AppColors.success,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text('Something went wrong!'));
                }
              },
            ),
            BlocBuilder<TodoBloc, TodoState>(
              builder: (context, state) {
                if (state is TodoLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is TodoLoaded) {
                  final completedItems =
                      state.todos.where((todo) => todo.isCompleted).toList();

                  return ListView.builder(
                    itemCount: completedItems.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(completedItems[index].title),
                        trailing: const Icon(Icons.done, color: Colors.green),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text('Something went wrong!'));
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(Todo todo) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Delete Task',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        content: const Text('Are you sure you want to delete this task?'),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'No',
              style: TextStyle(color: AppColors.error, fontSize: 14),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text(
              'Yes',
              style: TextStyle(color: AppColors.success, fontSize: 14),
            ),
            onPressed: () {
              context.read<TodoBloc>().add(DeleteTodo(id: todo.id));

              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${todo.title} Delete Sucessfully'),
                  backgroundColor: AppColors.error,
                  duration: const Duration(seconds: 2),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
