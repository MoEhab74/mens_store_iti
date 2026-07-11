import 'package:flutter/material.dart';
import 'package:mens_store/core/themes/app_colors.dart';

class SearchAndFilter extends StatelessWidget {
  const SearchAndFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Search bar
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search products',
              hintStyle: const TextStyle(
                color: AppColors.hintTextColor,
                fontWeight: FontWeight.w400,
                fontSize: 16.0,
              ),
              prefixIcon: const Padding(
                padding: EdgeInsets.only(left: 18.0),
                child: Icon(Icons.search, size: 32, color: Color(0xff999999)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                  width: 2.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(
                  color: AppColors.grayColor,
                  width: 1.0,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8.0),
        // Filter Icon button
        Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: const Icon(
            Icons.filter_list,
            color: AppColors.whiteColor,
            size: 28.0,
          ),
        ),
      ],
    );
  }
}
