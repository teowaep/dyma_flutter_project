import 'package:flutter/material.dart';

import 'models/city_model.dart';
import 'views/home/home_view.dart';
import 'views/city/city_view.dart';
import 'views/404/not_found.dart';

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
      routes: {'/': (context) => HomeView()},
      onGenerateRoute: (settings) {
        if (settings.name == CityView.routeName) {
          final City city = settings.arguments as City;
          return MaterialPageRoute(
            builder: (context) {
              return CityView(city: city);
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
