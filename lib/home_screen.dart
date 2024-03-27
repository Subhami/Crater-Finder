import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> craters = [
    {
      'name': 'Beyenchime-Salaatin',
      'country': 'Russia',
      'latitude': 71.058056,
      'longitude': 121.689722,
      'type': 'Complex',
      'diameter': 8.0,
    },
    {
      'name': 'Bigach',
      'country': 'Kazakhstan',
      'latitude': 48.575833,
      'longitude': 82.036389,
      'type': 'Complex',
      'diameter': 8.0,
    },
    // Add the remaining craters here...
    {
      'name': 'Zhamanshin',
      'country': 'Kazakhstan',
      'latitude': 48.360556,
      'longitude': 60.936667,
      'type': 'Complex',
      'diameter': 14.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crater Finder'),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(45.0, 90.0),
          zoom: 3.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayerOptions(
            markers: _buildMarkers(),
          ),
        ],
      ),
    );
  }

  List<Marker> _buildMarkers() {
    return craters.map((crater) {
      return Marker(
        width: 40.0,
        height: 40.0,
        point: LatLng(crater['latitude'], crater['longitude']),
        builder: (ctx) => Container(
          child: IconButton(
            icon: Icon(Icons.location_on),
            color: Colors.red,
            onPressed: () {
              // TODO: Implement on press functionality
            },
          ),
        ),
      );
    }).toList();
  }
}
