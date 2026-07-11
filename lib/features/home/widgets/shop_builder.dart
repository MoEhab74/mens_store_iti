import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mens_store/core/themes/app_colors.dart';
import 'package:mens_store/core/ui/loading_lottie.dart';
import 'package:mens_store/features/home/cubits/products/cubit.dart';
import 'package:mens_store/features/home/cubits/products/state.dart';
import 'package:mens_store/features/home/models/product_model.dart';
import 'package:mens_store/features/home/widgets/product_item.dart';

class ShopBuilder extends StatefulWidget {
  const ShopBuilder({super.key});

  @override
  State<ShopBuilder> createState() => _ShopBuilderState();
}

class _ShopBuilderState extends State<ShopBuilder> {
  List<ProductModel> products = [];
  @override
  void initState() {
    super.initState();
    context.read<ProductSCubit>().getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductSCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoadingState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: const Center(child: LoadingLottie()),
          );
        } else if (state is ProductsFailureState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Center(child: Text(state.errorMessage)),
          );
        } else if (state is ProductsSuccessState) {
          products = state.products as List<ProductModel>;
          return RefreshIndicator(
            color: AppColors.primaryColor,
            backgroundColor: Colors.white,
            onRefresh: () async {
              context.read<ProductSCubit>().getAllProducts();
            },
            child: AnimationLimiter(
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.h,
                  crossAxisSpacing: 16.w,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredGrid(
                    position: index,
                    duration: const Duration(milliseconds: 600),
                    columnCount: 2,
                    child: SlideAnimation(
                      verticalOffset: 200.0,
                      child: FadeInAnimation(
                        child: ProductItem(product: products[index]),
                      ),
                    ),
                  );
                },
                itemCount: products.length,
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
