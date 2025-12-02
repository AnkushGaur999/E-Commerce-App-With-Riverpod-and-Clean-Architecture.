import 'package:flutter/material.dart';
import 'package:plux/src/core/constants/app_colors.dart';

class CategoryList extends StatelessWidget {
  final List categories;

  const CategoryList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.widthOf(context);

    final isMobile = width < 600;

    final length = categories.length > 5 ? 5 : categories.length;

    return SliverToBoxAdapter(
      child: SizedBox(
        height: isMobile ? 64 : 84,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: length,
          itemBuilder: (context, index) {
            return Container(
              width: isMobile ? 100 : width/(length * 1.08),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                categories[index].name!,
                style: const TextStyle(color: Colors.white),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            );
          },
        ),
      ),
    );
  }
}
