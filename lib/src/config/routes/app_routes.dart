import 'package:go_router/go_router.dart';
import 'package:plux/src/data/models/product/product_model.dart';
import 'package:plux/src/presentation/views/dashboard/dashboard_screen.dart';
import 'package:plux/src/presentation/views/product/all_product_screen.dart';
import 'package:plux/src/presentation/views/product/product_details_screen.dart';
import 'package:plux/src/presentation/views/product/search_product_screen.dart';
import 'package:plux/src/presentation/views/splash/splash_screen.dart';

class AppRoutes {
  static const String splash = "splash";
  static const String dashboard = 'dashboard';
  static const String allProducts = 'all-products';
  static const String searchProducts = 'search-products';
  static const String productDetails = 'product-details';

  static const String _splash = "/";
  static const String _dashboard = '/dashboard';
  static const String _allProducts = '/all-products';
  static const String _searchProducts = '/search-products';
  static const String _productDetails = '/product-details';

  static final GoRouter router = GoRouter(
    initialLocation: _splash,
    routes: [
      GoRoute(
        name: splash,
        path: _splash,
        builder: (context, state) => const SplashScreen(),
      ),

      GoRoute(
        name: dashboard,
        path: _dashboard,
        builder: (context, state) => const DashboardScreen(),
      ),

      GoRoute(
        name: allProducts,
        path: _allProducts,
        builder: (context, state) => const AllProductScreen(),
      ),

      GoRoute(
        name: searchProducts,
        path: _searchProducts,
        builder: (context, state) => const SearchProductScreen(),
      ),

      GoRoute(
        name: productDetails,
        path: _productDetails,
        builder: (context, state) {
          final product = state.extra is ProductModel
              ? state.extra as ProductModel
              : null;
          return ProductDetailsScreen(product: product);
        },
      ),
    ],
  );
}
