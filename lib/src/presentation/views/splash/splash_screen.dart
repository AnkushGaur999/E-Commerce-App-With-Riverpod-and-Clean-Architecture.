import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:plux/src/config/generated/assets.gen.dart';
import 'package:plux/src/config/routes/app_routes.dart';
import 'package:plux/src/core/services/token_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2)).then((value) async {

      if (await TokenService.isUsedLoggedIn() == true) {
        if (mounted) context.goNamed(AppRoutes.dashboard);
      } else {
        if (mounted) context.goNamed(AppRoutes.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Assets.icons.plux.image(width: 180, height: 180)),
    );
  }
}
