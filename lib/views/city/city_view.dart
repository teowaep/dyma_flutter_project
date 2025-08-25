import 'package:dyma_flutter_project/views/city/widgets/trip_activity_list.dart';
import 'package:flutter/material.dart';

import '../../models/trip_model.dart';
import '../../models/activity_model.dart';
import '../../datas/data.dart' as data;

import 'widgets/activity_list.dart';
import 'widgets/trip_overview.dart';
import '../../widgets/data.dart';

class CityView extends StatefulWidget {
  final List<Activity> activities = data.activities;

  CityView({super.key});

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
  State<CityView> createState() => _CityState();
}

class _CityState extends State<CityView> with WidgetsBindingObserver {
  late Trip mytrip;
  late int index;
  late List<Activity> activities;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    mytrip = Trip(activities: [], city: 'Paris', date: null);
    index = 0;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    activities = Data.of(context).activities;
  }

  List<Activity> get tripActivities {
    return activities
        .where((activity) => mytrip.activities.contains(activity.id))
        .toList();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
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

  void switchIndex(newIndex) {
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
    activities = Data.of(context).activities;

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.chevron_left),
        title: Text('Paris'),
        actions: [Icon(Icons.more_vert)],
      ),
      body: Container(
        child: widget.showContext(
          context: context,
          children: [
            TripOverview(setDate: setDate, trip: mytrip),
            Expanded(
              child: index == 0
                  ? ActivityList(
                      activities: activities,
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
