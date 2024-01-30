/*import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../models/api.dart';
import '../models/sensor_data.dart';

class SensorDataProvider extends ChangeNotifier {
  List<Sensor> _sensorData = [];
 final DatabaseReference _ref = FirebaseDatabase.instance.ref('sensor_data');
  List<Sensor> get sensorData => _sensorData;

  set sensorData(List<Sensor> newData) {
    _sensorData = newData;
    notifyListeners();
  }
  Stream<List<Sensor>> getSensorDataStream() {
    return _ref.onValue.map((event) {
      List<Sensor> sensorData = [];

      final dataSnapshot = event.snapshot;
      final Object? data = dataSnapshot.value;

      if (data != null && data is Map<dynamic, dynamic>) {
        data.forEach((key, value) {
          if (value is Map<String, dynamic>) {
            Sensor sensor = Sensor.fromJson(value);
            sensorData.add(sensor);
          }
        });
      }

      return sensorData;
    });
  }
}
*/
