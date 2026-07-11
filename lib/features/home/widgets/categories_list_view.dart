import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mens_store/core/ui/loading_lottie.dart';
import 'package:mens_store/features/home/cubits/categories/cubit.dart';
import 'package:mens_store/features/home/cubits/categories/state.dart';
import 'package:mens_store/features/home/cubits/products/cubit.dart';
import 'package:mens_store/features/home/widgets/category_item.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({super.key});

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  int selectedIndex = 0;
  @override
  void initState() {
    context.read<CategoriesCubit>().fetchAllCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesSuccessState) {
          return Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: SizedBox(
              height: 50,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: state.categories.length,
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                      if (selectedIndex == 0) {
                        context.read<ProductSCubit>().getAllProducts();
                      } else {
                        context.read<ProductSCubit>().getProductsByCategory(
                              state.categories[index].id!,
                            );
                      }
                    },
                    child: CategoryItem(
                      margin: index + 1 == state.categories.length
                          ? const EdgeInsets.only(right: 16)
                          : null,
                      category: state.categories[index].name,
                      isSelected: selectedIndex == index,
                    ),
                  );
                },
              ),
            ),
          );
        } else if (state is CategoriesFailureState) {
          return Center(child: Text(state.errorMessage));
        } else {
          return const Center(child: LoadingLottie());
        }
      },
    );
  }
}
