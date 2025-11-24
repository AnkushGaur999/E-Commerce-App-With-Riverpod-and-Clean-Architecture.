import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:plux/src/config/routes/app_routes.dart';
import 'package:plux/src/presentation/providers/product_provider/product_provider.dart';

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

      body: Consumer(
        builder: (context, ref, child) {
          final searchProductsAsync = ref.watch(searchProductProvider);

          // final searchProductNotifier = ref.read(
          //   searchProductProvider.notifier,
          // );

          return searchProductsAsync.when(
            data: (value) {
              if (value!.products.isEmpty) {
                return Center(child: Text("Search Product"));
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
            error: (error, stacktrace) => SizedBox(),
            loading: () => CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _searchBar() {
    return TextFormField(
      controller: _searchEditingController,
      focusNode: _searchFocusNode,
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: Colors.black12,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 12.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.black12, width: 1),
        ),
      ),

      onChanged: _onSearchChanged,
    );
  }
}
