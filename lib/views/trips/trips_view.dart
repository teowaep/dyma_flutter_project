import 'package:flutter/material.dart';

import '../../widgets/dyma_drawer.dart';

class TripsView extends StatefulWidget {
  static const String routeName = '/trips';

  const TripsView({super.key});

  @override
  State<TripsView> createState() => _TripsViewState();
}

class _TripsViewState extends State<TripsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mes voyages')),
      drawer: DymaDrawer(),
      body: Center(child: Text('Page des voyages')),
    );
  }
}
