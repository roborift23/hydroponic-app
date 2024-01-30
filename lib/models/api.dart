/*import 'package:firebase_database/firebase_database.dart';
import 'sensor_data.dart';

class GetRequest {
  final DatabaseReference _ref = FirebaseDatabase.instance.ref('sensor_data');

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
*.*/
