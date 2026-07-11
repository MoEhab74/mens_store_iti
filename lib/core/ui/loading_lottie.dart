import 'package:flutter/material.dart';
import 'package:mens_store/core/themes/app_colors.dart';

class LoadingLottie extends StatelessWidget {
  const LoadingLottie({super.key, this.width, this.height});
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final double w = width ?? 40.0;
    final double h = height ?? 40.0;

    return Center(
      child: SizedBox(
        width: w,
        height: h,
        child: CircularProgressIndicator(
          color: AppColors.primaryColor,
          strokeWidth: 3,
        ),
      ),
    );
  }
}

