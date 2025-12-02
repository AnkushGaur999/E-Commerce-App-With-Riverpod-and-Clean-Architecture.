import 'package:go_router/go_router.dart';
import 'package:plux/src/data/models/product/product_model.dart';
import 'package:plux/src/presentation/views/account/account_screen.dart';
import 'package:plux/src/presentation/views/auth/login/login_screen.dart';
import 'package:plux/src/presentation/views/cart/cart_screen.dart';
import 'package:plux/src/presentation/views/category/categories_screen.dart';
import 'package:plux/src/presentation/views/dashboard/dashboard_screen.dart';
import 'package:plux/src/presentation/views/dashboard/home/home_screen.dart';
import 'package:plux/src/presentation/views/notification/notifications_screen.dart';
import 'package:plux/src/presentation/views/orders/orders_screen.dart';
import 'package:plux/src/presentation/views/product/all_product_screen.dart';
import 'package:plux/src/presentation/views/product/product_details_screen.dart';
import 'package:plux/src/presentation/views/product/search_product_screen.dart';
import 'package:plux/src/presentation/views/settings/settings_screen.dart';
import 'package:plux/src/presentation/views/splash/splash_screen.dart';

class AppRoutes {
  static const String splash = "splash";
  static const String login = "login";
  static const String dashboard = 'dashboard';
  static const String home = 'home';
  static const String categories = 'categories';
  static const String cart = 'cart';
  static const String settings = 'settings';
  static const String notifications = 'notifications';
  static const String account = 'account';
  static const String orders = 'orders';
  static const String allProducts = 'all-products';
  static const String searchProducts = 'search-products';
  static const String productDetails = 'product-details';

  static const String _splash = "/";
  static const String _login = "/login";
  static const String _dashboard = '/dashboard';
  static const String _home = '/home';
  static const String _categories = '/categories';
  static const String _cart = '/cart';
  static const String _settings = '/settings';
  static const String _notifications = '/notifications';
  static const String _account = '/account';
  static const String _orders = '/orders';
  static const String _allProducts = '/all-products';
  static const String _searchProducts = '/search-products';
  static const String _productDetails = '/product-details';

  static final GoRouter router = GoRouter(
    initialLocation: _splash,
  //  observers: [RouteObserver()],
    routes: [
      GoRoute(
        name: splash,
        path: _splash,
        builder: (context, state) => const SplashScreen(),
      ),

      GoRoute(
        name: login,
        path: _login,
        builder: (context, state) => LoginScreen(),
      ),

      GoRoute(
        name: dashboard,
        path: _dashboard,
        builder: (context, state) => const DashboardScreen(),
      ),

      GoRoute(
        name: categories,
        path: _categories,
        builder: (context, state) => const CategoriesScreen(),
      ),

      GoRoute(
        name: home,
        path: _home,
        builder: (context, state) => const HomeScreen(),
      ),


      GoRoute(
        name: account,
        path: _account,
        builder: (context, state) => const AccountScreen(),
      ),

      GoRoute(
        name: settings,
        path: _settings,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        name: cart,
        path: _cart,
        builder: (context, state) => const CartScreen(),
      ),

      GoRoute(
        name: notifications,
        path: _notifications,
        builder: (context, state) => const NotificationsScreen(),
      ),

      GoRoute(
        name: orders,
        path: _orders,
        builder: (context, state) => const OrdersScreen(),
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
