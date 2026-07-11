import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mens_store/core/themes/app_colors.dart';
import 'package:mens_store/core/themes/app_styles.dart';
import 'package:mens_store/core/ui/app_button.dart';
import 'package:mens_store/features/home/models/product_model.dart';

class ProductsDetailsBody extends StatelessWidget {
  const ProductsDetailsBody({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: product.id ?? "74",
                  child: Center(
                    child: Container(
                      height: 370.h,
                      width: 340.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        image: DecorationImage(
                          image:
                              product.images?.isNotEmpty == true &&
                                  product.images!.first.isNotEmpty
                              ? CachedNetworkImageProvider(
                                  product.images!.first,
                                )
                              : const AssetImage('assets/images/logo.png')
                                    as ImageProvider,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),

                Text(
                  product.title ?? "There is no product title",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryColor,
                  ),
                ),

                SizedBox(height: 8.h),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 24.sp),
                    SizedBox(width: 6.w),
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "4.0/5 (45 reviews)",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: "  • 4.0/5 (45 reviews)",
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.secondaryColor,
                              ),
                            ),
                          ],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 12.h),

                SelectableText(
                  product.description ?? "There is no product description",
                  style: AppStyles.discriptionStyle,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),

        Divider(color: Colors.grey[300], thickness: 1),

        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 24.h,
          ).copyWith(top: 8.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Price\n",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.secondaryColor,
                        ),
                      ),
                      TextSpan(
                        text: "\$${product.price}",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                flex: 3,
                child: AppButton(
                  text: "Add to Cart",
                  onPressed: () {
                    AnimatedSnackBar.material(
                      "Product added to cart successfully",
                      type: AnimatedSnackBarType.success,
                    ).show(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
