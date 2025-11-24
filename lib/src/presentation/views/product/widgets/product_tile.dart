import 'package:flutter/material.dart';
import 'package:plux/src/data/models/product/product_model.dart';
import 'package:plux/src/presentation/views/product/widgets/price_chip.dart';
import 'image_fall_back.dart';
import 'info_chip.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({super.key, this.product,  this.onTap});

  final ProductModel? product;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final imageUrl =
        product?.thumbnail ??
        (product?.images != null && product!.images!.isNotEmpty
            ? product?.images!.first
            : null);
    final priceText = product?.price != null
        ? '₹${product?.price!.toStringAsFixed(0)}'
        : 'Price N/A';
    final rating = product?.rating?.toStringAsFixed(1) ?? '—';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                offset: const Offset(0, 8),
                blurRadius: 24,
              ),
            ],
          ),
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  width: 80,
                  height: 80,
                  child: imageUrl != null
                      ? Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              ImageFallback(title: product?.title),
                        )
                      : ImageFallback(title: product?.title),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            product?.title ?? 'Untitled product',
                            style: theme.textTheme.titleMedium,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        PriceChip(priceText: priceText),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      product?.description ?? 'No description available.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.textTheme.bodyMedium?.color?.withValues(
                          alpha: 0.8,
                        ),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        InfoChip(
                          icon: Icons.star_rounded,
                          label: rating,
                          background: Colors.amber.withValues(alpha: 0.18),
                          iconColor: Colors.amber.shade800,
                        ),
                        const SizedBox(width: 8),
                        if (product?.stock != null)
                          InfoChip(
                            icon: Icons.inventory_2_outlined,
                            label: '${product?.stock} in stock',
                            background: colorScheme.primary.withValues(
                              alpha: 0.12,
                            ),
                            iconColor: colorScheme.primary,
                          ),
                        const SizedBox(width: 8),
                        if (product?.category != null)
                          Expanded(
                            child: InfoChip(
                              icon: Icons.category_outlined,
                              label: product?.category ?? "beauty",
                              background: colorScheme.secondary.withValues(
                                alpha: 0.12,
                              ),
                              iconColor: colorScheme.secondary,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
