import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/models/tasks_model.dart';
import 'package:todolist/blocs/todo_bloc/bloc_exports.dart';
import 'package:todolist/common/widgets/icon_button.dart';
import 'package:todolist/utils/constants/color.dart';

import '../../../blocs/todo_bloc/todo_event.dart';

class TaskList extends StatefulWidget {
  const TaskList({
    Key? key,
    required this.taskList,
    required this.onEditTask,
  }) : super(key: key);

  final List<Todo> taskList;
  final Function(Todo) onEditTask;

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  int? longPressedIndex;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: widget.taskList.length,
      itemBuilder: (BuildContext context, int index) {
        final task = widget.taskList[index];
        return GestureDetector(
          onLongPress: () {
            setState(() {
              longPressedIndex = index;
            });
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            elevation: 4,
            child: Stack(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        task.title,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        task.description ?? '',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                if (longPressedIndex == index)
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          color: Colors.transparent,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 10.0,
                                right: 10.0,
                                child: CustomIconButton(
                                  onPressed: () {
                                    setState(() {
                                      longPressedIndex = null;
                                    });
                                  },
                                  icon: Icons.cancel,
                                  iconColor: AppColors.error,
                                ),
                              ),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomIconButton(
                                      onPressed: () {
                                        widget.onEditTask(task);
                                        setState(() {
                                          longPressedIndex = null;
                                        });
                                      },
                                      icon: Icons.edit,
                                      iconColor: AppColors.info,
                                    ),
                                    CustomIconButton(
                                      onPressed: () {
                                        context.read<TodoBloc>().add(
                                              DeleteTodo(id: task.id),
                                            );
                                        setState(() {
                                          longPressedIndex = null;
                                        });
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'Task Deleted Successfully'),
                                            backgroundColor: AppColors.error,
                                            duration: Duration(seconds: 2),
                                          ),
                                        );
                                      },
                                      icon: Icons.delete,
                                      iconColor: AppColors.error,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
