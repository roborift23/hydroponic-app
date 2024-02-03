class SensorData {
  final int humidity;
  final int nutrients;
  final int ph;
  final int temperature;
  final int waterlvl;

  SensorData({
    required this.humidity,
    required this.nutrients,
    required this.ph,
    required this.temperature,
    required this.waterlvl,
  });

  factory SensorData.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    final sensorData = data['sensor_data'];

    return SensorData(
      humidity: sensorData['humidity']?.toInt() ?? 0,
      nutrients: sensorData['nutrients']?.toInt() ?? 0,
      ph: sensorData['ph']?.toInt() ?? 0,
      temperature: sensorData['temperature']?.toInt() ?? 0,
      waterlvl: sensorData['waterlvl']?.toInt() ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    'data': {
      'sensor_data': {
        'humidity': humidity,
        'nutrients': nutrients,
        'ph': ph,
        'temperature': temperature,
        'waterlvl': waterlvl,
      },
    },
  };
}
