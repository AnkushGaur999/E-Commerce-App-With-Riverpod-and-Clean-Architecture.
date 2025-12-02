import 'package:flutter/material.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {

    bool isMobile = MediaQuery.widthOf(context)<600;

    return SliverToBoxAdapter(
      child: AspectRatio(
        aspectRatio: isMobile? 16 / 9: 0.25/0.08,
        child: Card(
          color: Colors.grey.shade300,
          child: Image.network(
            "https://cdn.dummyjson.com/product-images/womens-dresses/black-women's-gown/1.webp",
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
