import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final Set<Marker> _marker = {};
  final LatLng _currentPosition = LatLng(-7.8032076, 110.3573354);
  @override
  void initState() {
    _marker.add(Marker(
        markerId: MarkerId('-7.8032076, 110.3573354'),
        position: _currentPosition,
        icon: BitmapDescriptor.defaultMarker));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Google Maps'),
      ),
      body: GoogleMap(
        initialCameraPosition:
            CameraPosition(target: _currentPosition, zoom: 14),
        mapType: MapType.normal,
        markers: _marker,
        onTap: (position) {
          setState(() {
            _marker.add(Marker(
                markerId:
                    MarkerId('${position.latitude},${position.longitude}'),
                icon: BitmapDescriptor.defaultMarker,
                position: position));
          });
        },
      ),
    );
  }
}
