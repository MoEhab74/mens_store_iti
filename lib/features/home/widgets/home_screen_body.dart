import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mens_store/core/themes/app_styles.dart';
import 'package:mens_store/features/home/widgets/categories_list_view.dart';
import 'package:mens_store/features/home/widgets/search_and_filter.dart';
import 'package:mens_store/features/home/widgets/shop_builder.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});  

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: Text('Discover', style: AppStyles.primaryHeadLinesStyle),
          ),
          SizedBox(height: 16.0.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0).w,
            child: const SearchAndFilter(),
          ),
          SizedBox(height: 16.0.h),
          const CategoriesListView(),
          SizedBox(height: 16.0.h),
          const ShopBuilder(),
        ],
      ),
    );
  }
}

