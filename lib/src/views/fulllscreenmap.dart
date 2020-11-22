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
      floatingActionButton: botonesFlotantes(),
    );
  }

  Column botonesFlotantes() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        //Simbolos
        FloatingActionButton(
          child: Icon(Icons.location_on),
          onPressed: (){
            mapController.addSymbol(SymbolOptions(
              geometry: center,
              iconSize: 3,
              iconImage: 'attraction-15',
              textField: 'Quiero ir aqui',
              textOffset: Offset(0,2)
            ));
          }
        ),
        SizedBox(height: 5,),
        //ZoomIn
        FloatingActionButton(
          child: Icon(Icons.zoom_in),
          onPressed: (){
            mapController.animateCamera(CameraUpdate.zoomIn());
          }
        ),
        SizedBox(height: 5,),

        //ZoomOut
        FloatingActionButton(
          child: Icon(Icons.zoom_out),
          onPressed: (){
            mapController.animateCamera(CameraUpdate.zoomOut());
          }
        ),
        SizedBox(height: 5,),

        // Cambiar Estilo
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
    );
  }

  MapboxMap crearMapa() {
    return MapboxMap(
      styleString: selectedStyle,
        onMapCreated: _onMapCreated,
        initialCameraPosition:
        CameraPosition
        (
          tilt: 60,
          target: center,
          zoom: 20
        ),
      );
  }
}