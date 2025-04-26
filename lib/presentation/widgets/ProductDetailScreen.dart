import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../data/models/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title, style: const TextStyle(fontSize: 18)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl: product.image,
                  height: 250,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error, size: 40),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              product.title,
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "\$${product.price.toStringAsFixed(2)}",
              style: theme.textTheme.headlineSmall?.copyWith(
                color: Colors.green[700],
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.star, color: Colors.orange[400], size: 20),
                const SizedBox(width: 4),
                Text(
                  "${product.rating.rate} (${product.rating.count} reviews)",
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              product.description,
              style: theme.textTheme.bodyLarge,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
