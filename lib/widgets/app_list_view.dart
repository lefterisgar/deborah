import 'package:flutter/material.dart';

import '../models/software.dart';
import '../models/update.dart';
import 'app_card.dart';

class AppListView extends StatelessWidget {
  const AppListView({
    required this.apps,
    this.updates,
    this.onAppSelected,
    Key? key,
  }) : super(key: key);

  final List<Software> apps;
  final Map<String, Update>? updates;
  final void Function(Software app)? onAppSelected;

  @override
  Widget build(BuildContext context) {
    return ListView.custom(
      childrenDelegate: SliverChildBuilderDelegate(
        (context, index) {
          final app = apps[index];

          return AppCard(
            index: index,
            app: app,
            update: updates?[app.packageName],
            onAppSelected: onAppSelected,
          );
        },
        childCount: apps.length,
      ),
    );
  }
}
