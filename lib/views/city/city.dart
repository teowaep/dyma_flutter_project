import 'package:dyma_flutter_project/views/city/widgets/trip_activity_list.dart';
import 'package:flutter/material.dart';

import '../../models/trip.model.dart';
import '../../models/activity.model.dart';
import '../../datas/data.dart' as data;

import 'widgets/activity_list.dart';
import 'widgets/trip_overview.dart';

class City extends StatefulWidget {
  City({super.key});

  final List<Activity> activities = data.activities;

  @override
  State<City> createState() => _CityState();
}

class _CityState extends State<City> {
  late Trip mytrip;
  late int index;

  @override
  void initState() {
    super.initState();
    mytrip = Trip(activities: [], city: 'Paris', date: null);
    index = 0;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 8,
        shadowColor: Colors.black,
        leading: Icon(Icons.chevron_left),
        title: Text('Paris'),
        actions: [Icon(Icons.more_vert)],
      ),
      body: Container(
        child: Column(
          children: [
            TripOverview(setDate: setDate, trip: mytrip),
            Expanded(
              child: index == 0
                  ? ActivityList(activities: widget.activities)
                  : TripActivityList(),
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
