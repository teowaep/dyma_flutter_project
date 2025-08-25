import 'package:flutter/material.dart';

import 'widgets/city_card.dart';
import '../../models/city_model.dart';
import '../../widgets/ask_modal.dart';
import '../../widgets/dyma_drawer.dart';

class HomeView extends StatefulWidget {
  static const String routeName = '/';

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

  void openModal(BuildContext context) {
    askModal(context, "Hello, do you want to continue?");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('dymatrip')),
      drawer: DymaDrawer(),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ...cities.map((city) {
              return CityCard(city: city);
            }),
            ElevatedButton(
              onPressed: () {
                openModal(context);
              },
              child: Text('modal'),
            ),
          ],
        ),
      ),
    );
  }
}
