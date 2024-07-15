import 'package:flutter/material.dart';
import 'package:todolist/blocs/todo_bloc/bloc_exports.dart';
import 'package:todolist/models/tasks_model.dart';
import 'package:todolist/screens/task/widget/complete.dart';

import '../../../blocs/todo_bloc/todo_event.dart';
import '../../../blocs/todo_bloc/todo_state.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  late TodoBloc _todoBloc;
  late List<Todo> _completedItems;

  @override
  void initState() {
    super.initState();
    _todoBloc = context.read<TodoBloc>();
    _completedItems = [];

    _todoBloc.add(LoadTodos());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TodoLoaded) {
            final todoItems = state.todos;
            return ListView.builder(
              itemCount: todoItems.length,
              itemBuilder: (context, index) {
                final todo = todoItems[index];
                return ListTile(
                  title: Text(todo.title),
                  trailing: GestureDetector(
                    onTap: () {
                      _todoBloc.add(UpdateTodo(
                        todo: todo.copyWith(isCompleted: true),
                      ));
                      setState(() {
                        _completedItems.add(todo);
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey,
                          width: 2,
                        ),
                        color: todo.isCompleted
                            ? Colors.green
                            : Colors.transparent,
                      ),
                      child: todo.isCompleted
                          ? const Icon(Icons.done, color: Colors.white)
                          : null,
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
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Todo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done_all),
            label: 'Completed',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      CompletedTasksPage(completedItems: _completedItems)),
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _todoBloc.close();
    super.dispose();
  }
}
