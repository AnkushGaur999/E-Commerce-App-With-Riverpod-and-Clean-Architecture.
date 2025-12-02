import 'package:flutter/material.dart';
import 'package:plux/src/presentation/providers/dashboard/dashboard_state.dart';
import 'package:plux/src/presentation/views/dashboard/home/widgets/banner.dart';
import 'package:plux/src/presentation/views/dashboard/home/widgets/home_app_bar.dart';
import 'package:plux/src/presentation/views/dashboard/home/widgets/product_list.dart';
import 'package:plux/src/presentation/views/dashboard/home/widgets/selection_header.dart';
import 'category_list.dart';

class HomeContent extends StatelessWidget {
  final DashboardState value;

  const HomeContent(this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    final newProducts = value.products.getRange(0, 10).toList();
    final recommendedProducts = value.products.getRange(10, 20).toList();
    final famousProducts = value.products.getRange(20, 30).toList();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomScrollView(
        slivers: [
          const HomeAppBar(),

          const HomeBanner(),

         const SliverToBoxAdapter(
            child: Padding(
              padding:  EdgeInsets.only(top: 25, bottom: 6, left: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          CategoryList(categories: value.categories),

          const SectionHeader(title: "New Products"),
          ProductList(products: newProducts),

          const SectionHeader(title: "Famous Products"),
          ProductList(products: famousProducts),

          const SectionHeader(title: "Recommended Products"),
          ProductList(products: recommendedProducts),
        ],
      ),
    );
  }
}
