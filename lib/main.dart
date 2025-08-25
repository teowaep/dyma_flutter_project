import 'package:flutter/material.dart';

import 'models/city_model.dart';
import 'views/home/home_view.dart';
import 'views/city/city_view.dart';
import 'views/404/not_found.dart';
import 'views/trips/trips_view.dart';

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
        primaryColor: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routes: {'/': (context) => HomeView()},
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case CityView.routeName:
            return MaterialPageRoute(
              builder: (context) {
                final City city = settings.arguments as City;
                return CityView(city: city);
              },
            );
          case TripsView.routeName:
            return MaterialPageRoute(
              builder: (context) {
                return TripsView();
              },
            );
        }
        return null;
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            return NotFound();
          },
        );
      },
    );
  }
}
