import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mens_store/core/routing/app_routes.dart';
import 'package:mens_store/core/themes/app_styles.dart';
import 'package:mens_store/core/ui/loading_lottie.dart';
import 'package:mens_store/core/ui/primary_button_widget.dart';
import 'package:mens_store/core/utils/animated_snack_bar.dart';
import 'package:mens_store/core/utils/service_locator.dart';
import 'package:mens_store/features/auth/cubit/auth_cubit.dart';
import 'package:mens_store/features/auth/cubit/auth_states.dart';

class LogOutButtom extends StatelessWidget {
  const LogOutButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showLogoutDialog(context);
      },
      child: Container(
        padding: EdgeInsets.only(left: 8.w),
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        alignment: Alignment.centerLeft,
        height: 48.h,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.logout, color: Colors.red, size: 24.w),
            SizedBox(width: 8.w),
            Text(
              'Log Out',
              style: TextStyle(
                color: Colors.red,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.logout, color: Colors.red, size: 100.w),
              SizedBox(height: 16.h),
              Text('Log Out', style: AppStyles.primaryHeadLinesStyle),
              Text(
                'Are you sure you want to log out?',
                style: AppStyles.subTitlesStyle,
              ),
              BlocProvider.value(
                value: locator<AuthCubit>(),
                child: BlocConsumer<AuthCubit, AuthStates>(
                  listener: (context, state) {
                    if (state is AuthLoggedOutState) {
                      // Close the dialog first
                      Navigator.of(context).pop();
                      showAnimatedSnackbar(
                        context,
                        message: 'Logged out successfully',
                        type: AnimatedSnackBarType.success,
                      );
                      GoRouter.of(context).pushReplacement(AppRoutes.loginScreen);
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthLoadingState) {
                      return const Center(child: LoadingLottie());
                    } else {
                      return AppButton(
                        padding: EdgeInsets.only(top: 16.h),
                        onPressed: () {
                          // Implement your logout logic here
                          context.read<AuthCubit>().logOut();
                          // Don't close dialog here - let the listener handle it
                        },
                        text: 'Log Out',
                        color: Colors.red,
                        // width: double.infinity,
                      );
                    }
                  },
                ),
              ),
              AppButton(
                padding: EdgeInsets.only(top: 8.h, bottom: 16.h),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                text: 'Cancel',
                // width: double.infinity,
              ),
            ],
          ),
        ),
      );
    },
  );
}
