import 'package:flutter/material.dart';
import 'package:todolist/screens/auth/signup/signuppage.dart';
import '../../../../utils/constants/color.dart';
import '../../../../utils/constants/text_string.dart';

class SignInFooter extends StatelessWidget {
  const SignInFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppTextStrings.forNoAccount,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpPage()),
                );
              },
              child: const Text(
                AppTextStrings.signUp,
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
