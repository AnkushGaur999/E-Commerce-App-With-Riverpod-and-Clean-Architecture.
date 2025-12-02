import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plux/src/presentation/common_widgets/error_state_view.dart';
import 'package:plux/src/presentation/providers/category/category_provider.dart';

class CategoriesScreen extends ConsumerStatefulWidget {
  const CategoriesScreen({super.key});

  @override
  ConsumerState<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends ConsumerState<CategoriesScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    bool isMobile = MediaQuery.widthOf(context) < 600;

    return Scaffold(
        appBar: AppBar(title: Text("Categories")),
        body: ref
            .watch(categoryProvider)
            .when(
            data: (value) {
              return RefreshIndicator(
                onRefresh: () =>
                    ref.read(categoryProvider.notifier).fetchCategories(),
                child: GridView.builder(
                  itemCount: value.categories.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isMobile ? 3 : 6,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: _getRandomColor(),
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          colors: [_getRandomColor(), _getRandomColor()],
                        ),
                      ),
                      child: Text(
                        value.categories[index].name!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
            error: (error, stacktrace) =>
                ErrorStateView(
                  message: error.toString(),
                  onRetry: () =>
                      ref.read(categoryProvider.notifier).fetchCategories(),
                ),
            loading: () => Center(child: CircularProgressIndicator.adaptive()),
    )
    ,
    );
  }

  Color _getRandomColor() {
    return Color(Random().nextInt(0xFFFFFFFF)).withAlpha(0xFF);
  }
}
