import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../models/cart_item_model.dart';
import '../components/product_tile.dart';
import '../providers/products_provider.dart';
import '../providers/auth_provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final productsProvider = Provider.of<ProductsProvider>(
        context,
        listen: false,
      );
      // Загружаем категории только если ещё не загружены
      if (productsProvider.categories.isEmpty) {
        productsProvider.loadCategories();
      }
      // Товары подгружаются всегда (учитывают фильтр/поиск), но лоадер только при первой загрузке
      productsProvider.loadProducts();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    final productsProvider = Provider.of<ProductsProvider>(
      context,
      listen: false,
    );
    productsProvider.setSearchQuery(value);
  }

  void _addToCart(product, size) {
    final cart = Provider.of<Cart>(context, listen: false);
    cart.addItemToCart(
      CartItemModel(product: product, selectedSize: size, quantity: 1),
    );

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Товар добавлен в корзину")));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsProvider>(
      builder: (context, productsProvider, child) {
        return Column(
          children: [
            // Search bar
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: _onSearchChanged,
                decoration: const InputDecoration(
                  hintText: "Поиск",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),
            // Categories
            if (productsProvider.categories.isNotEmpty) ...[
              const SizedBox(height: 15),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  itemCount: productsProvider.categories.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return GestureDetector(
                        onTap: () {
                          productsProvider.setCategory(null);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: productsProvider.selectedCategoryId == null
                                ? Colors.black
                                : Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Center(
                            child: Text(
                              "Все",
                              style: TextStyle(
                                color:
                                    productsProvider.selectedCategoryId == null
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                    final category = productsProvider.categories[index - 1];
                    final isSelected =
                        productsProvider.selectedCategoryId == category.id;
                    return GestureDetector(
                      onTap: () {
                        productsProvider.setCategory(category.id);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.black : Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Center(
                          child: Text(
                            category.name,
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
            // Message
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Text(
                "Хорошая обувь ведёт дальше.",
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            // Products
            if (productsProvider.isLoading)
              const Expanded(child: Center(child: CircularProgressIndicator()))
            else if (productsProvider.products.isEmpty)
              Expanded(
                child: Center(
                  child: Text(
                    "Товары не найдены",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
              )
            else ...[
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Товары",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: productsProvider.products.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    final product = productsProvider.products[index];
                    return ProductTile(
                      product: product,
                      onTap: () {
                        if (product.availableSizes.isNotEmpty) {
                          _addToCart(product, product.availableSizes.first);
                        }
                      },
                    );
                  },
                ),
              ),
            ],
            const Padding(
              padding: EdgeInsets.only(top: 25.0, left: 25, right: 25),
              child: Divider(color: Colors.white),
            ),
          ],
        );
      },
    );
  }
}
