import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plux/src/config/generated/assets.gen.dart';
import 'package:plux/src/config/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2)).then((value) {
      if (mounted) context.goNamed(AppRoutes.allProducts);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Assets.icons.plux.image(width: 180, height: 180)),
    );
  }
}
