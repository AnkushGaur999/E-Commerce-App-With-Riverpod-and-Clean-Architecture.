import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plux/src/config/routes/app_routes.dart';

class ProductList extends StatelessWidget {
  final List products;

  const ProductList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.sizeOf(context).width < 600;


    return SliverToBoxAdapter(
      child: SizedBox(
        height:isMobile? 120: 180,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () => context.pushNamed(
                    AppRoutes.productDetails,
                    extra: products[index],
                  ),
                  child: Image.network(
                    products[index].images!.first,
                    width: isMobile? 100 : 160,
                    height: isMobile? 100 : 160,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
