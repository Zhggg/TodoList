import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/tasks_model.dart';
import '../../repositories/todo_repository.dart';
import 'todo_event.dart';
import 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository _todoRepository;

  TodoBloc(this._todoRepository) : super(TodoLoading()) {
    on<LoadTodos>(_onLoadTodos);
    on<AddTodo>(_onAddTodo);
    on<UpdateTodo>(_onUpdateTodo);
    on<DeleteTodo>(_onDeleteTodo);
  }

  Future<void> _onLoadTodos(LoadTodos event, Emitter<TodoState> emit) async {
    emit(TodoLoading());
    await emit.forEach<List<Todo>>(
      _todoRepository.getTodos(),
      onData: (todos) => TodoLoaded(todos),
      onError: (_, __) => TodoError(),
    );
  }

  Future<void> _onAddTodo(AddTodo event, Emitter<TodoState> emit) async {
    await _todoRepository.addTodo(event.todo);

    if (!emit.isDone) {
      emit(await _getUpdatedTodosState());
    }
  }

  Future<void> _onUpdateTodo(UpdateTodo event, Emitter<TodoState> emit) async {
    await _todoRepository.updateTodo(event.todo);

    if (!emit.isDone) {
      emit(await _getUpdatedTodosState());
    }
  }

  Future<void> _onDeleteTodo(DeleteTodo event, Emitter<TodoState> emit) async {
    await _todoRepository.deleteTodo(event.id);

    if (!emit.isDone) {
      emit(await _getUpdatedTodosState());
    }
  }

  Future<TodoState> _getUpdatedTodosState() async {
    final todos = await _todoRepository.getTodos().first;
    return TodoLoaded(todos);
  }
}
