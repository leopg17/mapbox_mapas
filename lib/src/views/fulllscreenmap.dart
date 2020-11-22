//Creamos un widget que sea el encargado de mostrar el mapa en pantalla completa
import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class FullScreenMap extends StatefulWidget {

  @override
  _FullScreenMapState createState() => _FullScreenMapState();
}

class _FullScreenMapState extends State<FullScreenMap> {
  MapboxMapController mapController;
  final center = LatLng(40.76815605079246, -73.97439239749016);
  String selectedStyle = 'mapbox://styles/leopg17/ckhsk9z6q1bk519o9z91yxxx1';
  final ligaStyle = 'mapbox://styles/leopg17/ckhsk5ybd1a7n1cn2fp6dfbjq';
  final streetStyle = 'mapbox://styles/leopg17/ckhsk9z6q1bk519o9z91yxxx1';

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: crearMapa(),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: Icon(Icons.map),
            onPressed: (){
              if (selectedStyle == ligaStyle){
                selectedStyle = streetStyle;
              } else {
                selectedStyle = ligaStyle;
              }

              setState(() {});
            }
          )
        ],
      ),
    );
  }

  MapboxMap crearMapa() {
    return MapboxMap(
      styleString: selectedStyle,
        onMapCreated: _onMapCreated,
        initialCameraPosition:
        CameraPosition
        (
          target: center,
          zoom: 14
        ),
      );
  }
}