import 'package:mens_store/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    this.category,
    this.isSelected = false,
    this.margin,
  });
  final String? category;
  final bool isSelected;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: AnimatedContainer(
        margin: margin ?? EdgeInsets.zero,
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: isSelected ? AppColors.primaryColor : Colors.grey[200]!,
            width: 1.5,
          ),
        ),
        child: Center(
          child: Text(
            category ?? 'Category',
            style: TextStyle(
              fontSize: isSelected ? 16.0 : 14.0,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
