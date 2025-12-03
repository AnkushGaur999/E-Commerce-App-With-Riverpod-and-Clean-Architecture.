import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plux/src/config/routes/app_routes.dart';
import 'package:plux/src/core/constants/app_colors.dart';
import 'package:plux/src/core/storage/local_storage.dart';
import 'package:plux/src/presentation/providers/theme/theme_provider.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  await LocalStorage.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return MaterialApp.router(
      title: 'Plux',
      themeMode: themeMode,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        textTheme: GoogleFonts.notoSansTextTheme(),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            minimumSize: const WidgetStatePropertyAll(Size(172, 52)),
            backgroundColor: const WidgetStatePropertyAll<Color>(
              AppColors.primaryColor,
            ),
            foregroundColor: const WidgetStatePropertyAll<Color>(AppColors.white),
            textStyle: const WidgetStatePropertyAll<TextStyle>(
              TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      darkTheme: ThemeData(
        primaryColor: AppColors.white,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.darkPrimary,
          brightness: Brightness.dark,
        ),
        textTheme: GoogleFonts.notoSansTextTheme(ThemeData.dark().textTheme),
        scaffoldBackgroundColor: AppColors.darkBackground,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.darkSurface,
          foregroundColor: AppColors.white,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            minimumSize: const WidgetStatePropertyAll(Size(172, 52)),
            backgroundColor: const WidgetStatePropertyAll<Color>(
              AppColors.darkPrimary,
            ),
            foregroundColor: const WidgetStatePropertyAll<Color>(AppColors.white),
            textStyle: const WidgetStatePropertyAll<TextStyle>(
              TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      routerConfig: AppRoutes.router,
    );
  }
}
