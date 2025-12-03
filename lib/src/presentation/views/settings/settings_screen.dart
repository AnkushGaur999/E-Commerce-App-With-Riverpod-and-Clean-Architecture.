import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:plux/src/config/routes/app_routes.dart';
import 'package:plux/src/core/constants/app_colors.dart';
import 'package:plux/src/core/services/token_service.dart';
import 'package:plux/src/presentation/providers/providers.dart';
import 'package:plux/src/presentation/providers/theme/theme_provider.dart';
import 'package:plux/src/presentation/views/settings/widgets/settings_section.dart';
import 'package:plux/src/presentation/views/settings/widgets/settings_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const _ProfileHeader(),
          const SizedBox(height: 20),
          SettingsSection(
            title: "ACCOUNT",
            children: [
              SettingsTile(
                icon: CupertinoIcons.person,
                title: "Edit Profile",
                onTap: () {},
              ),
              const Divider(height: 1, indent: 56),
              SettingsTile(
                icon: CupertinoIcons.lock,
                title: "Change Password",
                onTap: () {},
              ),
              const Divider(height: 1, indent: 56),
              SettingsTile(
                icon: CupertinoIcons.bell,
                title: "Notifications",
                onTap: () {},
              ),
            ],
          ),
          SettingsSection(
            title: "PREFERENCES",
            children: [
              SettingsTile(
                icon: CupertinoIcons.globe,
                title: "Language",
                subtitle: "English",
                onTap: () {},
              ),
              const Divider(height: 1, indent: 56),
              Consumer(
                builder: (context, ref, child) {
                  final themeMode = ref.watch(themeProvider);
                  final isDark = themeMode == ThemeMode.dark;

                  return SettingsTile(
                    icon: CupertinoIcons.moon,
                    title: "Dark Mode",
                    trailing: Switch.adaptive(
                      value: isDark,
                      onChanged: (value) {
                        ref.read(themeProvider.notifier).toggleTheme();
                      },
                      activeTrackColor: AppColors.primaryColor,
                      thumbColor: WidgetStateProperty.resolveWith((states) {
                        if (states.contains(WidgetState.selected)) {
                          return AppColors.white;
                        }
                        return null;
                      }),
                      inactiveTrackColor:
                          Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey[800]
                          : Colors.grey[300],
                    ),
                  );
                },
              ),
            ],
          ),
          SettingsSection(
            title: "SUPPORT",
            children: [
              SettingsTile(
                icon: CupertinoIcons.question_circle,
                title: "Help Center",
                onTap: () {},
              ),
              const Divider(height: 1, indent: 56),
              SettingsTile(
                icon: CupertinoIcons.doc_text,
                title: "Privacy Policy",
                onTap: () {},
              ),
              const Divider(height: 1, indent: 56),
              SettingsTile(
                icon: CupertinoIcons.doc_checkmark,
                title: "Terms of Service",
                onTap: () {},
              ),
            ],
          ),
          SettingsSection(
            title: "ACTIONS",
            children: [
              SettingsTile(
                icon: CupertinoIcons.square_arrow_left,
                title: "Log Out",
                iconColor: Colors.red,
                titleColor: Colors.red,
                trailing: const SizedBox.shrink(),
                onTap: () => _showLogoutDialog(context),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Center(
            child: Text(
              "Version 1.0.0",
              style: TextStyle(color: Colors.grey[500], fontSize: 12),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Icon
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: Colors.red.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    CupertinoIcons.square_arrow_left,
                    color: Colors.red,
                    size: 32,
                  ),
                ),
                const SizedBox(height: 20),

                // Title
                Text(
                  "Log Out",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
                const SizedBox(height: 12),

                // Message
                Text(
                  "Are you sure you want to log out?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.color?.withValues(alpha: 0.7),
                  ),
                ),
                const SizedBox(height: 28),

                // Buttons
                Row(
                  children: [
                    // Cancel Button
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          side: BorderSide(
                            color: Theme.of(context).dividerColor,
                            width: 1.5,
                          ),
                        ),
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).textTheme.bodyLarge?.color,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),

                    // Logout Button
                    Expanded(
                      child: Consumer(
                        builder: (context, ref, child) {
                          return ElevatedButton(
                            onPressed: () async {
                              await TokenService.clearTokens();
                              await ref.read(localStorageProvider).clear();
                              if (context.mounted) {
                                context.goNamed(AppRoutes.login);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              "Log Out",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ProfileHeader extends ConsumerWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(localStorageProvider).getUser();
    final name = user?.firstName != null && user?.lastName != null
        ? "${user!.firstName} ${user.lastName}"
        : user?.username ?? "Guest User";
    final email = user?.email ?? "Sign in to sync your data";

    return Container(
      color: Theme.of(context).cardColor,
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.primaryColor.withValues(
                    alpha: 0.1,
                  ),
                  child: Image.network(
                    user!.image!,
                    width: 52,
                    height: 52,
                    cacheWidth: 120,
                    cacheHeight: 120,
                    fit: BoxFit.cover,
                    color: AppColors.primaryColor,
                    errorBuilder: (context, child, stacktrace) => Icon(
                      CupertinoIcons.person_fill,
                      size: 30,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        email,
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.pencil_circle_fill,
              color: AppColors.primaryColor,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
