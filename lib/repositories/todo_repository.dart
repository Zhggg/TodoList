import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/tasks_model.dart';

class TodoRepository {
  final FirebaseFirestore _firestore;

  TodoRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  Stream<List<Todo>> getTodos() {
    return _firestore.collection('todos').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Todo.fromDocument(doc)).toList();
    });
  }

  Future<void> addTodo(Todo todo) {
    return _firestore.collection('todos').add(todo.toMap());
  }

  Future<void> updateTodo(Todo todo) {
    return _firestore.collection('todos').doc(todo.id).update(todo.toMap());
  }

  Future<void> deleteTodo(String id) {
    return _firestore.collection('todos').doc(id).delete();
  }
}
