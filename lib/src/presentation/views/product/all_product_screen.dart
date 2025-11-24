import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:plux/src/data/models/product/product_model.dart';
import 'package:plux/src/config/routes/app_routes.dart';
import 'package:plux/src/presentation/providers/product_provider/product_provider.dart';
import 'package:plux/src/presentation/views/product/widgets/product_tile.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => context.pushNamed(AppRoutes.searchProducts),
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer(
              builder: (context, ref, child) {
                final productsAsync = ref.watch(allProductProvider);
                final productNotifier = ref.read(allProductProvider.notifier);

                return productsAsync.when(
                  data: (state) => RefreshIndicator(
                    onRefresh: () async {
                      await productNotifier.getAllProducts();
                    },
                    child: ListView.builder(
                      itemCount: state.allProducts.length,
                      itemBuilder: (context, index) {
                        final product = state.allProducts[index];
                        return _AnimatedProductTile(
                          index: index,
                          product: product,
                          onTap: () => context.pushNamed(
                            AppRoutes.productDetails,
                            extra: product,
                          ),
                        );
                      },
                    ),
                  ),
                  loading: () => SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        6,
                        (index) => const Skeletonizer(
                          enabled: true,
                          child: ProductTile(),
                        ),
                      ).toList(),
                    ),
                  ),
                  error: (error, stackTrace) =>
                      Center(child: Text('Error: $error')),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _AnimatedProductTile extends StatefulWidget {
  const _AnimatedProductTile({
    required this.product,
    required this.index,
    required this.onTap,
  });

  final ProductModel product;
  final int index;
  final VoidCallback onTap;

  @override
  State<_AnimatedProductTile> createState() => _AnimatedProductTileState();
}

class _AnimatedProductTileState extends State<_AnimatedProductTile>
    with SingleTickerProviderStateMixin {
  static final Set<int> _animatedIndices = <int>{};

  AnimationController? _controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _offsetAnimation;
  late final Animation<double> _scaleAnimation;
  late final bool _shouldAnimate;

  @override
  void initState() {
    super.initState();
    _shouldAnimate = !_animatedIndices.contains(widget.index);

    if (_shouldAnimate) {
      _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 320),
      );

      _fadeAnimation = CurvedAnimation(
        parent: _controller!,
        curve: Curves.easeOut,
      );

      _offsetAnimation =
          Tween<Offset>(begin: const Offset(0, 0.05), end: Offset.zero).animate(
            CurvedAnimation(parent: _controller!, curve: Curves.easeOutCubic),
          );

      _scaleAnimation = Tween<double>(begin: 0.94, end: 1).animate(
        CurvedAnimation(parent: _controller!, curve: Curves.easeOutBack),
      );

      Future.delayed(Duration(milliseconds: widget.index * 35), () {
        if (mounted) {
          _controller?.forward().whenComplete(() {
            _animatedIndices.add(widget.index);
          });
        }
      });
    } else {
      _fadeAnimation = const AlwaysStoppedAnimation(1);
      _offsetAnimation = const AlwaysStoppedAnimation(Offset.zero);
      _scaleAnimation = const AlwaysStoppedAnimation(1);
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _offsetAnimation,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: ProductTile(product: widget.product, onTap: widget.onTap),
        ),
      ),
    );
  }
}
