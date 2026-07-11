import 'package:mens_store/core/themes/app_colors.dart';
import 'package:mens_store/features/home/models/product_model.dart';
import 'package:mens_store/features/home/widgets/product_details_body.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.primaryColor,
      ),
      body: ProductsDetailsBody(product: product),
    );
  }
}
