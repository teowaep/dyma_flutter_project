import 'package:flutter/material.dart';

import '../../../models/activity.model.dart';
import 'activity_card.dart';

class ActivityList extends StatelessWidget {
  final List<Activity> activities;

  const ActivityList({required this.activities, super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      mainAxisSpacing: 1,
      crossAxisSpacing: 1,
      crossAxisCount: 2,
      children: activities
          .map((activity) => ActivityCard(activity: activity))
          .toList(),
    );
  }
}
