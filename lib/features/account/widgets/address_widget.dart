import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mens_store/core/themes/app_colors.dart';
import 'package:mens_store/core/themes/app_styles.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({
    super.key,
    this.addressTitle,
    this.addressDetails,
    this.onTap,
  });
  final String? addressTitle;
  final String? addressDetails;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: 8.0.h),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 40.0.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: AppColors.secondaryColor.withValues(alpha: 0.4),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 24.w,
                color: AppColors.primaryColor,
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      addressTitle ?? 'Home',
                      style: AppStyles.bodyBlackStyle.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    SelectableText(
                      addressDetails ??
                          '123 Main St, Springfield, IL 62704, United States',
                      style: AppStyles.bodyGrayStyle.copyWith(
                        fontSize: 14.sp,
                        // fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
