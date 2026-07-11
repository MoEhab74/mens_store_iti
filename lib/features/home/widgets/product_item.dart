// product_item.dart
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mens_store/core/ui/loading_lottie.dart';
import 'package:mens_store/features/home/models/product_model.dart';
import 'package:mens_store/features/home/screens/product_details_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, this.onTap, required this.product});
  final VoidCallback? onTap;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        // clipBehavior : Clip.antiAlias ===> to make the image rounded with the card
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Hero(
                  tag: product.id ?? "12345",
                  child:
                      product.images?.isNotEmpty == true &&
                          product.images!.first.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: product.images!.first,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              const Center(child: LoadingLottie()),
                          errorWidget: (context, url, error) => Image.asset(
                            'assets/images/logo.png',
                            fit: BoxFit.cover,
                          ),
                        )
                      : Image.asset('assets/images/logo.png', fit: BoxFit.cover),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title ?? "No title",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    '\$${product.price}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
