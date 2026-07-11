import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mens_store/core/themes/app_styles.dart';
import 'package:mens_store/core/ui/hight_or_width_space.dart';
import 'package:mens_store/features/auth/login/presentation/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
        ).w.copyWith(bottom: 10).h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login to your account',
              style: AppStyles.primaryHeadLinesStyle,
            ),
            const HightOrWidthSpace(height: 8.0),
            Text(
              'It’s great to see you again.',
              style: AppStyles.subTitlesStyle,
            ),
            const HightOrWidthSpace(height: 24.0),
            const LoginForm(),
          ],
        ),
      ),
    ),
        );
  }
}
