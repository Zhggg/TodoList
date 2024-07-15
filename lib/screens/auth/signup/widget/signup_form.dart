import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todolist/blocs/auth_bloc/bloc_exports.dart';
import 'package:todolist/common/widgets/textfield.dart';
import 'package:todolist/utils/constants/text_string.dart';
import 'package:todolist/utils/routes/router_constant.dart';

import '../../../../blocs/auth_bloc/auth_event.dart';
import '../../../../blocs/auth_bloc/auth_state.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      context.read<AuthBloc>().add(AuthSignUpRequested(
            email: emailController.text,
            password: passwordController.text,
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Account created for ${state.email}!'),
          ));
          setState(() {
            _isLoading = false;
          });
          context.goNamed(AppRouteConstant.homeRouteName);
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.error),
          ));
          setState(() {
            _isLoading = false;
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
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
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _signUp,
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : const Text(AppTextStrings.createaccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
