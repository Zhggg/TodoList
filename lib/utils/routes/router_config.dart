import 'package:go_router/go_router.dart';
import 'package:todolist/screens/auth/signin/signinpage.dart';
import 'package:todolist/screens/auth/signup/signuppage.dart';
import 'package:todolist/screens/task/taskpage.dart';

import '../../common/widgets/botton_navigation.dart';
import 'router_constant.dart';

class AppRouter {
  GoRouter router = GoRouter(
    routes: [
      //--- HomePage ---
      GoRoute(
        name: AppRouteConstant.homeRouteName,
        path: '/',
        builder: (context, state) => const MainScreen(),
      ),
      //--- SignInPage ---//
      GoRoute(
        name: AppRouteConstant.signInRouteName,
        path: '/sign',
        builder: (context, state) => const SignInPage(),
      ),
      //--- SignUpPage ---//
      GoRoute(
        name: AppRouteConstant.signUpRouteName,
        path: '/signup',
        builder: (context, state) => const SignUpPage(),
      ),
      //--- Taskpage ---//
      GoRoute(
        name: AppRouteConstant.tasksRouteName,
        path: "/task",
        builder: (context, state) => const TaskScreen(),
      ),
    ],
  );
}
