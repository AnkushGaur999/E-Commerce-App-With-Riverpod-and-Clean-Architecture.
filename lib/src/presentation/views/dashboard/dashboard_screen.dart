import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.black12,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text("Hello"),

          // Consumer(builder: (context, ref, child) {
          //   final allProductAsync = ref.watch(allProductProvider);
          //   final allProducts = ref.read(allProductProvider.notifier);
          //
          //   return allProductAsync.when(
          //       data: (value) {
          //
          //       }, error: (error, stacktrace){
          //
          //   }, loading:()=> SizedBox());
          // })

        ],
      ),
    );
  }
}
