import 'package:flutter/material.dart';
import 'package:plux/src/core/constants/app_colors.dart';
import 'package:plux/src/presentation/views/cart/cart_screen.dart';
import 'package:plux/src/presentation/views/category/categories_screen.dart';
import 'package:plux/src/presentation/views/dashboard/home/home_screen.dart';
import 'package:plux/src/presentation/views/settings/settings_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  int _currentPageIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const CategoriesScreen(),
    const CartScreen(),
    const SettingsScreen(),
  ];

  void _bottomNavTap(int index) {
    setState(() {
      _currentPageIndex = index;
    });

    _pageController.animateToPage(
      _currentPageIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.bounceIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        onTap: (index) => _bottomNavTap(index),
        selectedItemColor: AppColors.primaryColor,
        selectedLabelStyle: TextStyle(
          color: AppColors.primaryColor,
          fontWeight: FontWeight.bold,
        ),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home_rounded),
          ),

          BottomNavigationBarItem(
            label: "Categories",
            icon: Icon(Icons.category_outlined),
          ),

          BottomNavigationBarItem(
            label: "Cart",
            icon: Icon(Icons.shopping_cart),
          ),

          BottomNavigationBarItem(
            label: "Settings",
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
