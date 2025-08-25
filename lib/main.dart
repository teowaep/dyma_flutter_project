import 'package:flutter/material.dart';

import 'views/home/home_view.dart';
// import 'views/city/city_view.dart';
// import 'widgets/data.dart';

void main() => runApp(DymaTrip());

class DymaTrip extends StatelessWidget {
  const DymaTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          elevation: 8,
          shadowColor: Colors.black,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeView(),
      // home: Data(child: CityView()),
    );
  }
}
