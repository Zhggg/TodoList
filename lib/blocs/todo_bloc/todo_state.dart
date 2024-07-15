import '../../models/tasks_model.dart';

abstract class TodoState {}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  final List<Todo> todos;

  TodoLoaded(this.todos);
}

class TodoError extends TodoState {
  final String message;
  final String? errorCode;

  TodoError({required this.message, this.errorCode});
}

class TodoAdded extends TodoState {}

class TodoUpdated extends TodoState {}

class TodoDelete extends TodoState {}
