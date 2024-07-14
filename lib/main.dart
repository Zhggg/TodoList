import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todolist/blocs/bloc/todo_event.dart';
import 'blocs/bloc_exports.dart';
import 'package:todolist/utils/theme/theme.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TodoBloc(TodoRepository())..add(LoadTodos()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'TodoList App',
        //----Router----
        routerConfig: router,
        //----Theme----
        themeMode: ThemeMode.system,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
      ),
    );
  }
}
