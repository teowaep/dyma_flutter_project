import 'package:flutter/material.dart';

import 'widgets/trip_activity_list.dart';
import 'widgets/activity_list.dart';
import 'widgets/trip_overview.dart';

import '../../datas/data.dart' as data;

import '../../models/activity_model.dart';
import '../../models/city_model.dart';
import '../../models/trip_model.dart';

class CityView extends StatefulWidget {
  static const String routeName = '/city';
  final List<Activity> activities = data.activities;
  final City city;

  CityView({super.key, required this.city});

  Flex showContext({
    required BuildContext context,
    required List<Widget> children,
  }) {
    var orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.landscape) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      );
    } else {
      return Column(children: children);
    }
  }

  @override
  State<CityView> createState() => _CityViewState();
}

class _CityViewState extends State<CityView> with WidgetsBindingObserver {
  late Trip mytrip;
  late int index;
  late List<Activity> activities;

  @override
  void initState() {
    super.initState();
    mytrip = Trip(activities: [], city: 'Paris', date: null);
    index = 0;
  }

  List<Activity> get tripActivities {
    return widget.activities
        .where((activity) => mytrip.activities.contains(activity.id))
        .toList();
  }

  void setDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2026),
    ).then((newDate) {
      if (newDate != null) {
        setState(() {
          mytrip.date = newDate;
        });
      }
    });
  }

  void switchIndex(int newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  void toggleActivity(String id) {
    setState(() {
      mytrip.activities.contains(id)
          ? mytrip.activities.remove(id)
          : mytrip.activities.add(id);
    });
  }

  void deleteTripActivity(String id) {
    setState(() {
      mytrip.activities.remove(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Organisation du voyage'),
        actions: [Icon(Icons.more_vert)],
      ),
      body: Container(
        child: widget.showContext(
          context: context,
          children: [
            TripOverview(
              cityName: widget.city.name,
              setDate: setDate,
              trip: mytrip,
            ),
            Expanded(
              child: index == 0
                  ? ActivityList(
                      activities: widget.activities,
                      selectedActivities: mytrip.activities,
                      toggleActivity: toggleActivity,
                    )
                  : TripActivityList(
                      activities: tripActivities,
                      deleteTripActivity: deleteTripActivity,
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        currentIndex: index,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Découverte'),
          BottomNavigationBarItem(
            icon: Icon(Icons.stars),
            label: 'Mes activités',
          ),
        ],
        onTap: switchIndex,
      ),
    );
  }
}
