import 'package:flutter/material.dart';

import 'city_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List cities = [
    {
      'cityName': 'Paris',
      'imagePath': 'assets/images/paris.jpg',
      'checked': false,
    },
    {
      'cityName': 'Lyon',
      'imagePath': 'assets/images/lyon.jpg',
      'checked': false,
    },
    {
      'cityName': 'Nice',
      'imagePath': 'assets/images/nice.jpg',
      'checked': false,
    },
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
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 8,
        shadowColor: Colors.black,
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
              return CityCard(
                cityName: city['cityName'],
                imagePath: city['imagePath'],
                checked: city['checked'],
                updateChecked: () => switchCityCheck(city),
              );
            }),
          ],
        ),
      ),
    );
  }
}
