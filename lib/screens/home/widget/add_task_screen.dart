import 'package:flutter/material.dart';
import 'package:todolist/blocs/bloc_exports.dart';
import 'package:todolist/common/widgets/textfield.dart';
import 'package:todolist/models/tasks_model.dart';
import 'package:todolist/utils/constants/color/color.dart';

import '../../../blocs/bloc/todo_event.dart';
import '../../../common/widgets/icon_button.dart';

class AddTaskScreen extends StatefulWidget {
  final Todo? initialTodo;

  const AddTaskScreen({super.key, this.initialTodo});

  @override
  AddTaskScreenState createState() => AddTaskScreenState();
}

class AddTaskScreenState extends State<AddTaskScreen> {
  late TextEditingController taskNameController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    taskNameController =
        TextEditingController(text: widget.initialTodo?.title ?? '');
    descriptionController =
        TextEditingController(text: widget.initialTodo?.description ?? '');
  }

  @override
  void dispose() {
    taskNameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.initialTodo != null ? "Edit Task" : "Add Task",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              CustomIconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icons.cancel,
                iconColor: AppColors.error,
              ),
            ],
          ),
          const SizedBox(height: 10),
          CustomTextField(
            label: 'Task Name',
            icon: Icons.title,
            controller: taskNameController,
          ),
          const SizedBox(height: 12),
          CustomTextField(
            label: 'Task Description',
            icon: Icons.description,
            controller: descriptionController,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              final todo = Todo(
                id: widget.initialTodo?.id ?? '',
                title: taskNameController.text.trim(),
                description: descriptionController.text.trim().isNotEmpty
                    ? descriptionController.text.trim()
                    : null,
                isCompleted: widget.initialTodo?.isCompleted ?? false,
              );

              if (widget.initialTodo != null) {
                context.read<TodoBloc>().add(UpdateTodo(todo: todo));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Task Updated Successfully'),
                    backgroundColor: AppColors.success,
                    duration: Duration(seconds: 2),
                  ),
                );
              } else {
                context.read<TodoBloc>().add(AddTodo(todo: todo));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Task Added Successfully'),
                    backgroundColor: AppColors.success,
                    duration: Duration(seconds: 2),
                  ),
                );
              }

              Navigator.of(context).pop();
            },
            child: Text(widget.initialTodo != null ? 'Update Task' : 'Save'),
          ),
          const SizedBox(
            height: 10.0,
          )
        ],
      ),
    );
  }
}
