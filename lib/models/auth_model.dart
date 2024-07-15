import 'package:cloud_firestore/cloud_firestore.dart';

class AuthModel {
  final String email;
  final String password;

  AuthModel({
    required this.email,
    required this.password,
  });

  factory AuthModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return AuthModel(
      email: data['email'] ?? '',
      password: data['password'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'password': password,
      'email': email,
    };
  }
}
