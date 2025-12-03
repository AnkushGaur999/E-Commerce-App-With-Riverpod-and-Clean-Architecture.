import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plux/src/config/generated/assets.gen.dart';
import 'package:plux/src/config/routes/app_routes.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12),
      ),
      leading: Assets.icons.plux.image(),
      title: Material(
        color: Colors.grey.shade300,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: (){},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              spacing: 10,
              children: [
                Icon(Icons.search, color: Colors.grey),
                Text("Search", style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => context.pushNamed(AppRoutes.notifications),
          icon: Icon(Icons.notifications, color: Theme.of(context).primaryColor),
        ),
      ],
    );
  }
}
