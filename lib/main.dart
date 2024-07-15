import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'blocs/auth_bloc/bloc_exports.dart';
import 'blocs/todo_bloc/bloc_exports.dart';
import 'package:todolist/utils/theme/theme.dart';
import 'blocs/todo_bloc/todo_event.dart';
import 'repositories/auth_repository.dart';
import 'repositories/todo_repository.dart';
import 'utils/routes/router_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const TodoListApp());
}

final router = AppRouter().router;

class TodoListApp extends StatelessWidget {
  const TodoListApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authRepository = AuthRepository();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TodoBloc(TodoRepository())..add(LoadTodos()),
        ),
        BlocProvider(
          create: (context) => AuthBloc(authRepository: authRepository),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'TodoList App',
        routerConfig: router,
        themeMode: ThemeMode.system,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
      ),
    );
  }
}
