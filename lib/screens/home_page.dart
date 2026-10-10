
import 'package:flutter/material.dart';
import '../data/product_data.dart';
import '../models/product.dart';
import '../widgets/banner_carousel.dart';
import '../widgets/category_item.dart';
import '../widgets/product_card.dart';
import 'category_page.dart';
import 'product_details_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const Color primaryColor = Color(0xFF3457D5);

  IconData categoryIcon(String category) {
    switch (category) {
      case 'Electronics':
        return Icons.devices_outlined;
      case 'Fashion':
        return Icons.checkroom_outlined;
      case 'Shoes':
        return Icons.directions_run_outlined;
      case 'Beauty':
        return Icons.face_retouching_natural;
      default:
        return Icons.watch_outlined;
    }
  }

  void openCategory(BuildContext context, String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryPage(categoryName: category),
      ),
    );
  }

  void openProduct(BuildContext context, Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailsPage(product: product),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FD),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F9FD),
        elevation: 0,
        titleSpacing: 20,
        title: Row(
          children: [
            Container(
              height: 42,
              width: 42,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(13),
              ),
              child: const Icon(
                Icons.shopping_bag_outlined,
                color: Colors.white,
                size: 25,
              ),
            ),
            const SizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MyShop',
                  style: TextStyle(
                    color: Color(0xFF202849),
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                  ),
                ),
                Text(
                  'SHOP SMART, LIVE BETTER',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 9,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Search',
            onPressed: () {
              showSearch(
                context: context,
                delegate: ProductSearchDelegate(
                  onSelected: (product) => openProduct(context, product),
                ),
              );
            },
            icon: const Icon(
              Icons.search,
              color: Color(0xFF202849),
            ),
          ),
          IconButton(
            tooltip: 'Cart',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Cart preview is not implemented in this assignment.',
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.shopping_bag_outlined,
              color: Color(0xFF202849),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),

              // Welcome section
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Find your style.',
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF202849),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Everything you love, in one place.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              // Promotional carousel
              const BannerCarousel(),

              const SizedBox(height: 28),

              // Categories heading
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF202849),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        openCategory(context, categories.first);
                      },
                      child: const Text('Explore'),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 13),

              // Horizontal category scrolling
              SizedBox(
                height: 100,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  separatorBuilder: (context, index) =>
                  const SizedBox(width: 15),
                  itemBuilder: (context, index) {
                    final category = categories[index];

                    return CategoryItem(
                      name: category,
                      icon: categoryIcon(category),
                      onTap: () => openCategory(context, category),
                    );
                  },
                ),
              ),

              const SizedBox(height: 27),

              // Popular products heading
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Popular Products',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF202849),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        openCategory(context, categories.first);
                      },
                      child: const Text('See All →'),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Reusable product cards
              GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.53,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];

                  return ProductCard(
                    product: product,
                    onTap: () => openProduct(context, product),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Simple working product search
class ProductSearchDelegate extends SearchDelegate<Product?> {
  final ValueChanged<Product> onSelected;

  ProductSearchDelegate({required this.onSelected});

  @override
  String get searchFieldLabel => 'Search products...';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '',
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildResults(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildResults(context);
  }

  Widget _buildResults(BuildContext context) {
    final results = products.where((product) {
      return product.name.toLowerCase().contains(query.toLowerCase()) ||
          product.category.toLowerCase().contains(query.toLowerCase());
    }).toList();

    if (results.isEmpty) {
      return const Center(child: Text('No products found.'));
    }

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final product = results[index];

        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(product.image),
          ),
          title: Text(product.name),
          subtitle: Text('Rs. ${product.price.toStringAsFixed(0)}'),
          onTap: () {
            close(context, product);
            onSelected(product);
          },
        );
      },
    );
  }
}
