import 'package:go_router/go_router.dart';
import 'package:todolist/screens/task/taskpage.dart';

import '../../common/widgets/botton_navigation.dart';
import 'router_constant.dart';

class AppRouter {
  GoRouter router = GoRouter(routes: [
    //--- HomePage ---
    GoRoute(
      name: AppRouteConstant.homeRouteName,
      path: '/',
      
      builder: (context, state) =>  const MainScreen(),
    ),
    //--- Taskpage ---//
    GoRoute(
      name: AppRouteConstant.tasksRouteName,
      path: "/task",
      builder: (context, state) => const TaskScreen(),
    ),
    // //--- Todolist ---//
    // GoRoute(
    //   name: AppRouteConstant.todoListRouteName,
    //   path: "/todolist",
    //   builder: (context, state) => const TodoList(),
    // ),
    // //--- Complete ---//
    // GoRoute(
    //   name: AppRouteConstant.completeRouteName,
    //   path: "/complete",
    //   builder: (context, state) => const Complete(),
    // ),
    // //--- Add Task ---//
    // GoRoute(
    //   name: AppRouteConstant.addTaskRouteName,
    //   path: "/addtask",
    //   builder: (context, state) => const AddTask(),
    // ),
  ],);
}