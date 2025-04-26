import 'package:flutter/material.dart';
import '../../data/services/api_service.dart';
import '../../data/models/product_model.dart';
import '../widgets/product_card.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shop Now',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        foregroundColor: Colors.black,
      ),
      backgroundColor: const Color(0xFFF7F7F7),
      body: FutureBuilder<List<Product>>(
        future: ApiService.fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Something went wrong 😢',
                style: theme.textTheme.bodyLarge?.copyWith(color: Colors.red),
              ),
            );
          } else {
            final products = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // changed from 3 to 2 for better spacing
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.65,
                ),
                itemBuilder:
                    (context, index) => ProductCard(product: products[index]),
              ),
            );
          }
        },
      ),
    );
  }
}
