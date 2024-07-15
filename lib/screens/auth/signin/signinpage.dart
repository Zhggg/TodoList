import 'package:flutter/material.dart';

import 'widget/signin_footer.dart';
import 'widget/signin_form.dart';
import 'widget/signin_header.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo, Title & Sub_title
                SizedBox(
                  height: 40.0,
                ),
                SignInHeader(),

                //Form
                SignInForm(),

                //footer
                SignInFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
