import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plux/src/core/constants/app_colors.dart';
import 'package:plux/src/data/models/cart/cart_product.dart';
import 'package:plux/src/presentation/common_widgets/error_state_view.dart';
import 'package:plux/src/presentation/providers/cart/cart_provider.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(title: const Text("My Cart")),
      body: ref
          .watch(cartProvider)
          .when(
            data: (response) {
              return RefreshIndicator(
                onRefresh: () =>
                    ref.read(cartProvider.notifier).fetchCartItems(),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: response.products!.length,
                        itemBuilder: (_, index) {
                          return _buildCartCard(response.products![index]);
                        },
                      ),
                    ),

                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            _priceRow("Total", response.total!, isBold: true),
                            const SizedBox(height: 6),
                            _priceRow(
                              "Discounted Total",
                              response.discountedTotal!,
                              color: Colors.green,
                              isBold: true,
                            ),

                            SizedBox(height: 24),

                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text("Pay   ₹${response.total}"),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            error: (error, _) => ErrorStateView(
              message: error.toString(),
              onRetry: () => ref.read(cartProvider.notifier).fetchCartItems(),
            ),
            loading: () =>
                Center(child: const CircularProgressIndicator.adaptive()),
          ),
    );
  }

  Widget _buildCartCard(CartProduct product) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),

          // Product List
          Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    product.thumbnail!,
                    height: 70,
                    width: 70,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title!,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 5),

                      Text("Qty: ${product.quantity}"),

                      const SizedBox(height: 4),

                      Row(
                        children: [
                          Text(
                            "₹${product.price}",
                            style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "₹${product.discountedTotal}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
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

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStarRating(_generateRandomRating()),

              Material(
                color: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(15),
                ),

                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 42,
                      height: 36,
                      child: InkWell(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                          topRight: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                        ),
                        onTap: () {},
                        child: Center(
                          child: Icon(Icons.add, size: 20, color: Colors.white),
                        ),
                      ),
                    ),

                    SizedBox(
                      width: 42,
                      height: 36,
                      child: InkWell(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          bottomLeft: Radius.circular(0),
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        onTap: () {},
                        child: Center(
                          child: Icon(
                            Icons.remove,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _priceRow(
    String title,
    num value, {
    bool isBold = false,
    Color? color,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$title:",
          style: TextStyle(
            color: color ?? Theme.of(context).textTheme.bodyLarge?.color,
            fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
        Text(
          "₹$value",
          style: TextStyle(
            color: color,
            fontWeight: isBold ? FontWeight.w700 : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildStarRating(double rating) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < rating.floor()) {
          return const Icon(Icons.star, color: Colors.amber, size: 18);
        } else if (index < rating) {
          return const Icon(Icons.star_half, color: Colors.amber, size: 18);
        } else {
          return const Icon(Icons.star_border, color: Colors.grey, size: 18);
        }
      }),
    );
  }

  double _generateRandomRating() {
    final random = Random();
    return 2.5 + random.nextDouble() * (5.0 - 2.5);
  }
}
