import 'package:flutter/material.dart';
import 'package:plux/src/data/models/product/product_model.dart';
import 'package:plux/src/presentation/views/product/widgets/info_chip.dart';
import 'package:plux/src/presentation/views/product/widgets/price_chip.dart';
import 'package:plux/src/presentation/views/product/widgets/product_details_gallery.dart';
import 'package:plux/src/presentation/views/product/widgets/product_details_section_card.dart';
import 'package:plux/src/presentation/views/product/widgets/product_details_utils.dart';
import 'package:plux/src/presentation/views/product/widgets/product_review_tile.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, this.product});

  final ProductModel? product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (product == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Product details'), centerTitle: true),
        body: const Center(
          child: Text('Product information is not available.'),
        ),
      );
    }

    final colorScheme = theme.colorScheme;
    final currentProduct = product!;
    final gallery = <String>{
      ...?currentProduct.images,
      if (currentProduct.thumbnail != null) currentProduct.thumbnail!,
    }.where((url) => url.isNotEmpty).toList();
    final priceText = currentProduct.price != null
        ? '₹${currentProduct.price!.toStringAsFixed(0)}'
        : 'Price not available';
    final rating = currentProduct.rating?.toStringAsFixed(1);
    final discount = currentProduct.discountPercentage?.toStringAsFixed(0);
    final description =
        currentProduct.description ?? 'No description provided for this item.';
    final tags = currentProduct.tags ?? const [];
    final reviews = currentProduct.reviews ?? const [];
    final metaRows = buildMetaRows(currentProduct);

    return Scaffold(
      appBar: AppBar(
        title: Text(currentProduct.title ?? 'Product details'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            tooltip: 'Share product',
            icon: const Icon(Icons.ios_share),
          ),
          IconButton(
            onPressed: () {

            },
            tooltip: 'Add to wishlist',
            icon: const Icon(Icons.favorite_border_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductGallery(title: currentProduct.title, gallery: gallery),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                currentProduct.title ?? 'Untitled product',
                                style: theme.textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 6),
                              if (currentProduct.brand != null)
                                Text(
                                  currentProduct.brand!,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    color: theme.textTheme.bodyMedium?.color
                                        ?.withValues(alpha: 0.7),
                                  ),
                                ),
                              if (currentProduct.category != null)
                                Text(
                                  currentProduct.category!,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: theme.textTheme.bodyMedium?.color
                                        ?.withValues(alpha: 0.7),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        if (currentProduct.price != null)
                          PriceChip(priceText: priceText),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        if (rating != null)
                          InfoChip(
                            icon: Icons.star_rounded,
                            label: '$rating / 5',
                            background: Colors.amber.withValues(alpha: 0.18),
                            iconColor: Colors.amber.shade800,
                          ),
                        if (discount != null)
                          InfoChip(
                            icon: Icons.local_offer_outlined,
                            label: '$discount% off',
                            background: colorScheme.tertiary.withValues(
                              alpha: 0.15,
                            ),
                            iconColor: colorScheme.tertiary,
                          ),
                        if (currentProduct.stock != null)
                          InfoChip(
                            icon: Icons.inventory_2_outlined,
                            label: '${currentProduct.stock} in stock',
                            background: colorScheme.primary.withValues(
                              alpha: 0.12,
                            ),
                            iconColor: colorScheme.primary,
                          ),
                        if (currentProduct.availabilityStatus != null)
                          InfoChip(
                            icon: Icons.check_circle_rounded,
                            label: currentProduct.availabilityStatus!,
                            background: colorScheme.secondaryContainer,
                            iconColor: colorScheme.onSecondaryContainer,
                          ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'About the product',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        height: 1.4,
                        color: theme.textTheme.bodyLarge?.color?.withValues(
                          alpha: 0.9,
                        ),
                      ),
                    ),
                    if (tags.isNotEmpty) ...[
                      const SizedBox(height: 24),
                      SectionCard(
                        title: 'Tags',
                        child: Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: tags
                              .map(
                                (tag) => Chip(
                                  label: Text(tag),
                                  backgroundColor: colorScheme.surfaceVariant
                                      .withValues(alpha: 0.5),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                    if (buildSpecificationRows(currentProduct).isNotEmpty)
                      SectionCard(
                        title: 'Specifications',
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: buildSpecificationRows(currentProduct),
                        ),
                      ),
                    if (buildLogisticsRows(currentProduct).isNotEmpty)
                      SectionCard(
                        title: 'Logistics & policy',
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: buildLogisticsRows(currentProduct),
                        ),
                      ),
                    if (metaRows.isNotEmpty)
                      SectionCard(
                        title: 'Meta information',
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: metaRows,
                        ),
                      ),
                    SectionCard(
                      title:
                          'Reviews ${reviews.isNotEmpty ? '(${reviews.length})' : ''}',
                      child: reviews.isEmpty
                          ? Text(
                              'No reviews yet. Be the first to share your experience.',
                              style: theme.textTheme.bodyMedium,
                            )
                          : Column(
                              children: reviews
                                  .map((review) => ReviewTile(review: review))
                                  .toList(),
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: double.infinity,
          child: FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_checkout_rounded),
            label: Text(
              'Add to cart • $priceText',
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
