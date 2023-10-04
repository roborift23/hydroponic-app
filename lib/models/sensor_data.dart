class Sensor {
  final String sensorName;
  final int ph;
  final int temperature;
  final int humidity;
  final int nutrients;
  final int waterlvl;

  Sensor({
    required this.sensorName,
    required this.ph,
    required this.temperature,
    required this.humidity,
    required this.nutrients,
    required this.waterlvl,
  });

  factory Sensor.fromJson(Map<String, dynamic> json) => Sensor(
        sensorName: json["sensorName"],
        ph: json["ph"],
        temperature: json["temperature"],
        humidity: json["humidity"],
        nutrients: json["nutrients"],
        waterlvl: json["waterlvl"],
      );

  Map<String, dynamic> toJson() => {
        "sensorName": sensorName,
        "ph": ph,
        "temperature": temperature,
        "humidity": humidity,
        "nutrients": nutrients,
        "waterlvl": waterlvl,
      };

  
}
