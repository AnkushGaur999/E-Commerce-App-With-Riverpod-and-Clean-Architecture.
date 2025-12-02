import 'package:flutter/material.dart';
import 'package:plux/src/data/models/product/reviews.dart';
import 'package:plux/src/presentation/views/product/widgets/product_details_utils.dart';

class ReviewTile extends StatelessWidget {
  const ReviewTile({super.key, required this.review});

  final Reviews review;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ratingText = review.rating != null
        ? '${review.rating} / 5'
        : 'Not rated';
    final reviewer = review.reviewerName?.trim().isNotEmpty == true
        ? review.reviewerName!
        : 'Anonymous shopper';
    final comment = review.comment?.trim().isNotEmpty == true
        ? review.comment!
        : '—';
    final date = formatDate(review.date);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.person_pin_circle_outlined,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  reviewer,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(ratingText, style: theme.textTheme.labelLarge),
            ],
          ),
          if (date.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              date,
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.7),
              ),
            ),
          ],
          const SizedBox(height: 12),
          Text(comment, style: theme.textTheme.bodyMedium),
        ],
      ),
    );
  }
}
