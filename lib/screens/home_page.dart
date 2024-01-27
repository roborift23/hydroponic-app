import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/api.dart'; // Import your API class
import '../models/sensor_data.dart'; // Import your Sensor class

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Stream<List<Sensor>> sensorDataStream;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    super.initState();
    _tooltipBehavior = TooltipBehavior(enable: true);
    sensorDataStream = GetRequest().getSensorDataStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hydroponic System')
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: StreamBuilder<List<Sensor>>(
          stream: sensorDataStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: const CircularProgressIndicator());
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData) {
              return Center(child: Text(snapshot.data as String));
            } else {
              // Extract sensor data from the snapshot
              List<Sensor> sensorData = snapshot.data!;

              return ListView(
              shrinkWrap: true,
                children:[ SizedBox(
                  height: 400,
                  width: 300, 
                     child: SfCartesianChart(
                    tooltipBehavior: _tooltipBehavior,
                    title: ChartTitle(text: 'Sensor Data'),
                    legend: Legend(isVisible: true),
                    primaryXAxis: CategoryAxis(),
                    palette: <Color>[
                      Colors.blue.withOpacity(0.5),
                      Colors.red.withOpacity(0.5),
                      Colors.green.withOpacity(0.5),
                      Colors.yellow.withOpacity(0.5),
                      Colors.purple.withOpacity(0.5)
                    ],
                    series: <CartesianSeries<Sensor, String>>[
                      ColumnSeries<Sensor, String>(
                        name: "pH",
                        dataSource: sensorData,
                        xValueMapper: (Sensor data, _) => data.sensorName,
                        yValueMapper: (Sensor data, _) => data.ph,
                        dataLabelSettings: DataLabelSettings(isVisible: false),
                        enableTooltip: true,
                      ),
                      ColumnSeries<Sensor, String>(
                        name: "Temperature",
                        dataSource: sensorData,
                        xValueMapper: (Sensor data, _) => data.sensorName,
                        yValueMapper: (Sensor data, _) => data.temperature,
                        dataLabelSettings: DataLabelSettings(isVisible: false),
                        enableTooltip: true,
                      ),
                      ColumnSeries<Sensor, String>(
                        name: "Humidity",
                        dataSource: sensorData,
                        xValueMapper: (Sensor data, _) => data.sensorName,
                        yValueMapper: (Sensor data, _) => data.humidity,
                        dataLabelSettings: DataLabelSettings(isVisible: false),
                        enableTooltip: true,
                      ),
                      ColumnSeries<Sensor, String>(
                        name: "Water Level",
                        dataSource: sensorData,
                        xValueMapper: (Sensor data, _) => data.sensorName,
                        yValueMapper: (Sensor data, _) => data.waterlvl,
                        dataLabelSettings: DataLabelSettings(isVisible: false),
                        enableTooltip: true,
                      ),
                      ColumnSeries<Sensor, String>(
                        name: "Nutrients",
                        dataSource: sensorData,
                        xValueMapper: (Sensor data, _) => data.sensorName,
                        yValueMapper: (Sensor data, _) => data.waterlvl,
                        dataLabelSettings: DataLabelSettings(isVisible: false),
                        enableTooltip: true,
                      ),
                    ],
                  ),
                ),
                StaggeredGrid.count(
  crossAxisCount: 4,
  mainAxisSpacing: 4,
  crossAxisSpacing: 4,
  children:   [
    StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: 2,
      child: Card(
        child: Row(children: [
          Image.asset('asset/logos/temperature.png'),
          const Text('27 ℃', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold))
        ],)
      )
    ),
    StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: 1,
      child: Card(
        child: Row(children: [
          Image.asset('asset/logos/water.png'),
          const Text('18 ⁜', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold))
        ],)
      )
    ),
    StaggeredGridTile.count(
      crossAxisCellCount: 1,
      mainAxisCellCount: 1,
      child: Card(
        child: Row(children: [
          Expanded(child: Image.asset('asset/logos/ph.png', )),
          Expanded(child: const Text('7',style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)))
        ],)
      ),
    ),
    StaggeredGridTile.count(
      crossAxisCellCount: 1,
      mainAxisCellCount: 1,
      child: Card(
        child: Row(children: [
          Image.asset('asset/logos/humidity.png'),
          //const Text('Humidity')
        ],)
      )
    ),
    StaggeredGridTile.count(
      crossAxisCellCount: 4,
      mainAxisCellCount: 2,
      child: Card(
        child: Row(children: [
          Image.asset('asset/logos/nutrient.png'),
          //const Text('Nutrients')
        ],)
      ),
    ),
  ],
)

                
                ]
              );
            }
          },
        ),
      ),
    );
  }
}
