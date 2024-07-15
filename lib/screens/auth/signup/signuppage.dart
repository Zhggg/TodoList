import 'package:flutter/material.dart';
import 'widget/signup_form.dart';
import 'widget/signup_header.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              //Header
              SignUpHeader(),

              //Form
              SignUpForm(),

              // //Footer
              // SignUpFooter()
            ],
          ),
        ));
  }
}
