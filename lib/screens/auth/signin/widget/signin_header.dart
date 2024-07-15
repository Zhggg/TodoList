import 'package:flutter/material.dart';
import 'package:todolist/utils/constants/image_string.dart';

import '../../../../utils/constants/text_string.dart';

class SignInHeader extends StatelessWidget {
  const SignInHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Image(
            height: 150,
            image: AssetImage(
              AppImages.appLogo,
            ),
          ),
        ),
        Text(
          AppTextStrings.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          AppTextStrings.loginSubtitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(
          height: 30.0,
        ),
      ],
    );
  }
}
