import 'package:flutter/material.dart';

import '../../../models/activity_model.dart';

class TripActivityList extends StatelessWidget {
  final List<Activity> activities;
  final Function deleteTripActivity;

  const TripActivityList({
    super.key,
    required this.activities,
    required this.deleteTripActivity,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        var activity = activities[index];
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero, // coins carrés
          ),
          color: Colors.white,
          child: ListTile(
            leading: CircleAvatar(backgroundImage: AssetImage(activity.image)),
            title: Text(activity.name),
            subtitle: Text(activity.city),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                deleteTripActivity(activity.id);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'L\'activité ${activity.name} a été supprimée du voyage',
                    ),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3),
                  ),
                );
              },
            ),
          ),
        );
      },
      itemCount: activities.length,
    );
  }
}
