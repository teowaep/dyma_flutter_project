import 'package:flutter/material.dart';

import 'widgets/city_card.dart';
import '../../models/city_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeState();
}

class _HomeState extends State<HomeView> {
  List cities = [
    City(name: 'Paris', image: 'assets/images/paris.jpg'),
    City(name: 'Lyon', image: 'assets/images/lyon.jpg'),
    City(name: 'Nice', image: 'assets/images/nice.jpg'),
  ];

  void switchCityCheck(city) {
    int index = cities.indexOf(city);
    setState(() {
      cities[index]['checked'] = !cities[index]['checked'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home),
        title: Text('dymatrip'),
        actions: [Icon(Icons.more_vert)],
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ...cities.map((city) {
              return CityCard(city: city);
            }),
          ],
        ),
      ),
    );
  }
}
