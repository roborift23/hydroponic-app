import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../models/api.dart'; // Import your API class
import '../models/sensor_data.dart'; // Import your Sensor class

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Stream<List<Sensor>> sensorDataStream;
  

  @override
  void initState() {
    super.initState();
    
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
                children:[ 
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
           Text(sensorData.isNotEmpty ? sensorData[0].temperature.toString() : 'N/A', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold))
        ],)
      )
    ),
    StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: 1,
      child: Card(
        child: Row(children: [
          Image.asset('asset/logos/water.png'),
         Text(sensorData.isNotEmpty ? sensorData[0].waterlvl.toString() : 'N/A', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold))
        ],)
      )
    ),
    StaggeredGridTile.count(
      crossAxisCellCount: 1,
      mainAxisCellCount: 1,
      child: Card(
        child: Row(children: [
          Expanded(child: Image.asset('asset/logos/ph.png', )),
           Expanded(child: Text(sensorData.isNotEmpty ? sensorData[0].ph.toString() : 'N/A', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)))
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
