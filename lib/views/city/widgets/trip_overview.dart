import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/trip_model.dart';

class TripOverview extends StatelessWidget {
  final VoidCallback setDate;
  final Trip trip;
  final String cityName;

  double get amount {
    return 0;
  }

  const TripOverview({
    super.key,
    required this.setDate,
    required this.trip,
    required this.cityName,
  });

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    var size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(10),
      height: 200,
      width: orientation == Orientation.landscape
          ? size.width * 0.5
          : size.width,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cityName,
            style: TextStyle(
              fontSize: 25,
              decoration: TextDecoration.underline,
            ),
          ),
          SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: Text(
                  trip.date == null
                      ? 'Choisissez une date'
                      : DateFormat('d/MM/y').format(trip.date!),
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ElevatedButton(
                onPressed: setDate,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                child: Text('Sélectionner une date'),
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Montant (par personnes)',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Text(
                '$amount €',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
