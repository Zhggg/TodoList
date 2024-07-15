import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todolist/blocs/todo_bloc/bloc_exports.dart';
import 'package:todolist/blocs/todo_bloc/todo_bloc.dart';
import 'package:todolist/common/widgets/icon_button.dart';
import 'package:todolist/models/tasks_model.dart';
import 'package:todolist/screens/home/widget/task_list.dart';
import 'package:todolist/screens/home/widget/add_task_screen.dart';

import '../../blocs/todo_bloc/todo_event.dart';
import '../../blocs/todo_bloc/todo_state.dart';
import '../../repositories/todo_repository.dart';
import '../../utils/constants/color.dart';
import '../../utils/routes/router_constant.dart';

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

  String getFirebseErrorMessage(String errorCode) {
    switch (errorCode) {
      case "permission-denied":
        return "You need to login to add a todo";

      default:
        return "An error occurred. Please try again.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoBloc, TodoState>(
      listener: (context, state) {
        if (state is TodoError) {
          if (state.errorCode != null) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: const Text('Do you Have an Account?'),
                actions: <Widget>[
                  TextButton(
                    child: const Text(
                      'No',
                      style: TextStyle(color: AppColors.error, fontSize: 14),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      context.goNamed(AppRouteConstant.signUpRouteName);
                    },
                  ),
                  TextButton(
                    child: const Text(
                      'Yes',
                      style: TextStyle(color: AppColors.success, fontSize: 14),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      context.goNamed(AppRouteConstant.signInRouteName);
                    },
                  ),
                ],
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(getFirebseErrorMessage(state.errorCode!)),
                backgroundColor: AppColors.error,
                duration: Duration(seconds: 2),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('An error occurred. Please try again.'),
                backgroundColor: AppColors.error,
                duration: Duration(seconds: 2),
              ),
            );
          }
        } else if (state is TodoAdded) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Task Added Successfully'),
              backgroundColor: AppColors.success,
              duration: Duration(seconds: 2),
            ),
          );
          context.read<TodoBloc>().add(LoadTodos());
        } else if (state is TodoUpdated) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Task Updated Successfully'),
              backgroundColor: AppColors.success,
              duration: Duration(seconds: 2),
            ),
          );
          context.read<TodoBloc>().add(LoadTodos());
        }
      },
      builder: (context, state) {
        if (state is TodoLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TodoError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Please refresh the todos 😉'),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      context.read<TodoBloc>().add(LoadTodos());
                    },
                    child: Text("Refresh"))
              ],
            ),
          );
        } else if (state is TodoLoaded) {
          final taskList =
              state.todos.where((todo) => !todo.isCompleted).toList();
          return Scaffold(
            appBar: AppBar(
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () => _addTask(context),
                        child: const Text("Add Tasks"),
                      ),
                      if (FirebaseAuth.instance.currentUser != null)
                        CustomIconButton(
                          onPressed: () {
                            FirebaseAuth.instance.signOut();
                            setState(() {});
                          },
                          icon: Icons.logout,
                          iconColor: AppColors.black,
                        ),
                    ],
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
