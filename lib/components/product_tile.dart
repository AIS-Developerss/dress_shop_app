import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../models/cart.dart';
import '../providers/favorites_provider.dart';
import '../providers/auth_provider.dart';
import '../pages/product_detail_page.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const ProductTile({super.key, required this.product, this.onTap});

  void _toggleFavorite(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final favoritesProvider = Provider.of<FavoritesProvider>(
      context,
      listen: false,
    );

    if (!authProvider.isAuthenticated) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Войдите, чтобы добавить в избранное')),
      );
      return;
    }

    final isFavorite = favoritesProvider.isFavorite(product.id);
    if (isFavorite) {
      final favoriteId = favoritesProvider.getFavoriteId(product.id);
      if (favoriteId != null) {
        favoritesProvider.removeFavorite(favoriteId, product.id);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Удалено из избранного')));
      }
    } else {
      favoritesProvider.addFavorite(authProvider.user!.id, product.id);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Добавлено в избранное')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<Cart, FavoritesProvider>(
      builder: (context, cart, favoritesProvider, _) {
        final isInCart = cart.userCart.any(
          (item) => item.product.id == product.id,
        );
        final isFavorite = favoritesProvider.isFavorite(product.id);

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
                // Product image with favorite button
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        product.imagePaths.first,
                        height: 200,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    // Favorite button
                    Positioned(
                      top: 8,
                      right: 8,
                      child: GestureDetector(
                        onTap: () => _toggleFavorite(context),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.9),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : Colors.grey[700],
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
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
                      // Plus / Check button
                      if (onTap != null)
                        GestureDetector(
                          onTap: isInCart ? null : onTap,
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: isInCart ? Colors.green : Colors.black87,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                            ),
                            child: Icon(
                              isInCart ? Icons.check : Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
