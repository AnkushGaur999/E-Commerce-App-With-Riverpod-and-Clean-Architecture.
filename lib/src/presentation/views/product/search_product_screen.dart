import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:plux/src/config/routes/app_routes.dart';
import 'package:plux/src/presentation/providers/product/product_provider.dart';

class SearchProductScreen extends ConsumerStatefulWidget {
  const SearchProductScreen({super.key});

  @override
  ConsumerState<SearchProductScreen> createState() =>
      _SearchProductScreenState();
}

class _SearchProductScreenState extends ConsumerState<SearchProductScreen> {
  final TextEditingController _searchEditingController =
      TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  Timer? _debounce;

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      ref
          .read(searchProductProvider.notifier)
          .searchProducts(_searchEditingController.text);
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _searchFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchFocusNode.dispose();
    _searchEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: _searchBar()),

      body: ref
          .watch(searchProductProvider)
          .when(
            data: (value) {
              if (value!.products.isEmpty) {
                return const Center(child: Text("Search Product"));
              }
              return ListView.builder(
                itemCount: value.products.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.network(value.products[index].images!.first),
                    title: Text(value.products[index].title ?? "No name"),
                    onTap: () => context.pushNamed(
                      AppRoutes.productDetails,
                      extra: value.products[index],
                    ),
                  );
                },
              );
            },
            error: (error, stacktrace) => const SizedBox(),
            loading: () =>
                Center(child: const CircularProgressIndicator.adaptive()),
          ),
    );
  }

  Widget _searchBar() {
    return TextFormField(
      controller: _searchEditingController,
      focusNode: _searchFocusNode,
      decoration: InputDecoration(
        filled: true,
        hintText: "Search",
        hintStyle: TextStyle(color: Colors.grey.shade500),
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 12.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white, width: 1),
        ),
      ),

      onChanged: _onSearchChanged,
    );
  }
}
