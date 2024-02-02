import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../models/sensor_data.dart';

class SensorDataProvider extends ChangeNotifier {
  List<SensorData> _sensorData = [];
  final DatabaseReference _ref = FirebaseDatabase.instance.ref('data/sensor_data');

  List<SensorData> get sensorData => _sensorData;

  set sensorData(List<SensorData> newData) {
    _sensorData = newData;
    notifyListeners();
  }

  Stream<List<SensorData>> getSensorDataStream() {
    return _ref.onValue.map((DatabaseEvent event) {
      List<SensorData> sensorData = [];

      try {
        final dataSnapshot = event.snapshot;
        final Object? data = dataSnapshot.value;

        if (data != null && data is Map<dynamic, dynamic>) {
          data.forEach((key, value) {
            if (value is Map<String, dynamic>) {
              SensorData sensor = SensorData.fromJson(value);
              sensorData.add(sensor);
            }
          });
        }

        // Update the local sensorData list and notify listeners
        sensorData = sensorData; // Use the extracted sensor data
        notifyListeners();

        return sensorData;
      } catch (error) {
        print("Error retrieving sensor data: $error");
        // Handle the error appropriately, e.g., log it, display a user-friendly message, or take corrective actions
        // You might consider returning an empty list or a list with a placeholder sensor to indicate an error
        return sensorData; // Returning an empty list in this case
      }
    });
  }
}
