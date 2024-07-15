import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    try {
      final todos = await _todoRepository.getTodos().first;
      emit(TodoLoaded(todos));
    } catch (e) {
      emit(TodoError(message: e.toString()));
    }
  }

  Future<void> _onAddTodo(AddTodo event, Emitter<TodoState> emit) async {
    try {
      await _todoRepository.addTodo(event.todo);
      // if (state is TodoLoaded) {
      //   final updatedTodos = [...(state as TodoLoaded).todos, event.todo];
      //   emit(TodoLoaded(updatedTodos));
      // }
      emit(TodoAdded());
    } on FirebaseException catch (e) {
      emit(TodoError(message: e.toString(), errorCode: e.code));
    } catch (e) {
      emit(TodoError(message: e.toString()));
    }
  }

  Future<void> _onUpdateTodo(UpdateTodo event, Emitter<TodoState> emit) async {
    try {
      await _todoRepository.updateTodo(event.todo);
      if (state is TodoLoaded) {
        // final updatedTodos = [...(state as TodoLoaded).todos, event.todo];
        final updateTodos = (state as TodoLoaded).todos.map((t) {
          if (t.id == event.todo.id) {
            return event.todo;
          }
          return t;
        }).toList();
        emit(TodoLoaded(updateTodos));
      }
    } on FirebaseException catch (e) {
      emit(TodoError(message: e.toString(), errorCode: e.code));
    } catch (e) {
      emit(TodoError(message: e.toString()));
    }
  }

  Future<void> _onDeleteTodo(DeleteTodo event, Emitter<TodoState> emit) async {
    try {
      await _todoRepository.deleteTodo(event.id);
      if (state is TodoLoaded) {
        final updatedTodos = (state as TodoLoaded)
            .todos
            .where((todo) => todo.id != event.id)
            .toList();
        emit(TodoLoaded(updatedTodos));
      }
    } on FirebaseException catch (e) {
      emit(TodoError(message: e.toString(), errorCode: e.code));
    } catch (e) {
      emit(TodoError(message: e.toString()));
    }
  }
}
