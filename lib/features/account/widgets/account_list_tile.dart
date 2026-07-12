import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mens_store/core/themes/app_colors.dart';
import 'package:mens_store/core/themes/app_styles.dart';

class AccountListTile extends StatelessWidget {
  const AccountListTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0).copyWith(top: 0, bottom: 8),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primaryColor),
        title: Text(title, style: AppStyles.bodyBlackStyle),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16.sp,
          color: AppColors.secondaryColor,
        ),
        onTap: onTap,
      ),
    );
  }
}
