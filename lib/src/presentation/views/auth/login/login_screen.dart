import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:plux/src/config/generated/assets.gen.dart';
import 'package:plux/src/config/routes/app_routes.dart';
import 'package:plux/src/core/services/token_service.dart';
import 'package:plux/src/presentation/providers/auth/auth_provider.dart';
import 'package:plux/src/presentation/providers/auth/auth_state.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final ValueNotifier<bool> _isPasswordVisible = ValueNotifier(true);

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _listenLoginState() {
    ref.listen(authProvider, (prev, next) {
      next.whenOrNull(
        loginSuccess: (value) {
          context.goNamed(AppRoutes.allProducts);
        },
        loginError: (value) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(value)));
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    _listenLoginState();
    final isLoading = ref
        .watch(authProvider)
        .maybeWhen(loading: () => true, orElse: () => false);

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 600;

          return Center(
            child: SizedBox(
              width: isMobile ? 380 : 420,
              height: MediaQuery.sizeOf(context).height,
              child: Column(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),

                  Assets.icons.plux.image(height: 120, width: 120),

                  const Text("Login with your username & password"),

                  const SizedBox(height: 10),

                  TextFormField(
                    controller: _userNameController,
                    decoration: InputDecoration(
                      labelText: "User Name",
                      border: OutlineInputBorder(),
                    ),
                  ),

                  SizedBox(height: 10),

                  ValueListenableBuilder(
                    valueListenable: _isPasswordVisible,
                    builder: (context, value, child) {
                      return TextFormField(
                        controller: _passwordController,
                        obscureText: value,
                        decoration: InputDecoration(
                          labelText: "Password",
                          suffixIcon: IconButton(
                            onPressed: () => _isPasswordVisible.value =
                                !_isPasswordVisible.value,
                            icon: _isPasswordVisible.value
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                          ),
                          border: OutlineInputBorder(),
                        ),
                      );
                    },
                  ),

                  ElevatedButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            if (_userNameController.text.isEmpty ||
                                _passwordController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Enter Valid user/password",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.red.shade500,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      12,
                                    ),
                                  ),
                                ),
                              );

                              return;
                            }

                            ref
                                .read(authProvider.notifier)
                                .login(
                                  userName: _userNameController.text,
                                  password: _passwordController.text,
                                );
                          },
                    child: isLoading
                        ? const SizedBox(
                            width: 28,
                            height: 28,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : Text("LOGIN"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
