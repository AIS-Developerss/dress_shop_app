import 'package:flutter/material.dart';
import '../models/product.dart';
import '../pages/product_detail_page.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const ProductTile({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(product: product),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 25),
        width: 280,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Product image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                product.imagePaths.first,
                height: 200,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            // Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                product.description,
                style: TextStyle(color: Colors.grey[600]),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // Price + details
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product name
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 5),
                      // Price
                      Text(
                        '${product.price} ₽',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  // Plus button
                  if (onTap != null)
                    GestureDetector(
                      onTap: onTap,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                        ),
                        child: const Icon(Icons.add, color: Colors.white),
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
