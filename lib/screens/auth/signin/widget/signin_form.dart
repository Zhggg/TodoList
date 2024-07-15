import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todolist/common/widgets/textfield.dart';
import 'package:todolist/utils/constants/text_string.dart';

import '../../../../blocs/auth_bloc/auth_bloc.dart';
import '../../../../blocs/auth_bloc/auth_event.dart';
import '../../../../blocs/auth_bloc/auth_state.dart';
import '../../../../utils/routes/router_constant.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _signIn() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      context.read<AuthBloc>().add(AuthLoginRequested(
            email: emailController.text,
            password: passwordController.text,
          ));
      context.goNamed(AppRouteConstant.homeRouteName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Welcome ${state.email}!'),
          ));
          setState(() {
            _isLoading = false;
          });
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.error),
          ));
          setState(() {
            _isLoading = false;
          });
        }
      },
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                children: [
                  CustomTextField(
                    label: AppTextStrings.email,
                    icon: Icons.email,
                    controller: emailController,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomTextField(
                    addSuffix: true,
                    label: AppTextStrings.passwordLogin,
                    icon: Icons.lock,
                    controller: passwordController,
                  ),
                  const SizedBox(
                    height: 30 / 2,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _signIn,
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : const Text(AppTextStrings.signIn),
            ),
          ),
          const SizedBox(
            height: 8 * 2,
          ),
        ],
      ),
    );
  }
}
