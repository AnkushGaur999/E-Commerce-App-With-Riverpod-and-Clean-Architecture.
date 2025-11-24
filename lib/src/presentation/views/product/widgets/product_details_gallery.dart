import 'package:flutter/material.dart';
import 'package:plux/src/presentation/views/product/widgets/image_fall_back.dart';

class ProductGallery extends StatefulWidget {
  const ProductGallery({super.key, required this.gallery, this.title});

  final List<String> gallery;
  final String? title;

  @override
  State<ProductGallery> createState() => _ProductGalleryState();
}

class _ProductGalleryState extends State<ProductGallery> {
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final primaryImage = widget.gallery.isNotEmpty
        ? widget.gallery[_activeIndex.clamp(0, widget.gallery.length - 1)]
        : null;
    final hasThumbnails = widget.gallery.length > 1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(28),
              bottomRight: Radius.circular(28),
            ),
            child: primaryImage != null
                ? Image.network(
                    primaryImage,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        ImageFallback(title: widget.title),
                  )
                : ImageFallback(title: widget.title),
          ),
        ),
        if (hasThumbnails)
          SizedBox(
            height: 96,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final url = widget.gallery[index];
                final isActive = index == _activeIndex;
                return GestureDetector(
                  onTap: () => setState(() => _activeIndex = index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: isActive
                            ? colorScheme.primary
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Image.network(
                          url,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                                color: colorScheme.surfaceContainerHighest,
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.broken_image_outlined,
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemCount: widget.gallery.length,
            ),
          ),
      ],
    );
  }
}
