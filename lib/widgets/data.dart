import 'package:flutter/material.dart';

import '../models/activity_model.dart';
import '../../../datas/data.dart' as data;

class Data extends InheritedWidget {
  final List<Activity> activities = data.activities;

  Data({super.key, required super.child});

  @override
  bool updateShouldNotify(Data oldWidget) {
    return true;
  }

  static Data? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Data>();
  }

  static Data of(BuildContext context) {
    final Data? result = maybeOf(context);
    assert(result != null, 'No Data found in context');
    return result!;
  }
}
