import 'package:flutter/material.dart';

// import 'views/home/home.dart';
import 'views/city/city.dart';

void main() => runApp(DymaTrip());

class DymaTrip extends StatelessWidget {
  const DymaTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: City());
  }
}
