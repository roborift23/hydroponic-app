import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import '../models/api.dart'; // Import your API class
import '../models/sensor_data.dart';
import '../provider/h_provider.dart'; // Import your Sensor class

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Stream<List<Sensor>> sensorDataStream;
  

  @override
  void initState() {
    super.initState();
    
    Provider.of<SensorDataProvider>(context, listen: false).getSensorDataStream();
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
        child: Consumer<SensorDataProvider>(
          builder: (context, sensorProvider, _){
            if (sensorProvider.sensorData.isEmpty) {
              return Center(child: CircularProgressIndicator());
            } else {
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
           Text(sensorProvider.sensorData[0].temperature.toString(), style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold))
        ],)
      )
    ),
    StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: 1,
      child: Card(
        child: Row(children: [
          Image.asset('asset/logos/water.png'),
         Text(sensorProvider.sensorData[0].temperature.toString(), style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold))
        ],)
      )
    ),
    StaggeredGridTile.count(
      crossAxisCellCount: 1,
      mainAxisCellCount: 1,
      child: Card(
        child: Row(children: [
          Expanded(child: Image.asset('asset/logos/ph.png', )),
           Expanded(child: Text(sensorProvider.sensorData[0].temperature.toString(), style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)))
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
