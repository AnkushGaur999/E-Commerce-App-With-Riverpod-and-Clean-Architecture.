import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plux/src/presentation/common_widgets/error_state_view.dart';
import 'package:plux/src/presentation/providers/dashboard/dashboard_provider.dart';
import 'package:plux/src/presentation/views/dashboard/home/widgets/home_content.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;


  @override
  Widget build(BuildContext context) {
    super.build(context);

    final dashboardState = ref.watch(dashboardProvider);

    return Scaffold(
      body: SafeArea(
        child: dashboardState.when(
          data: (value) => RefreshIndicator(
            onRefresh: () => ref.read(dashboardProvider.notifier).refresh(),
            child: HomeContent(value),
          ),
          error: (error, _) => ErrorStateView(
            message: error.toString(),
            onRetry: () => ref.read(dashboardProvider.notifier).refresh(),
          ),
          loading: () =>
              const Center(child: CircularProgressIndicator.adaptive()),
        ),
      ),
    );
  }
}
