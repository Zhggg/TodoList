import '../../models/tasks_model.dart';

abstract class TodoState {}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  final List<Todo> todos;

  TodoLoaded(this.todos);
}

class TodoError extends TodoState {}
