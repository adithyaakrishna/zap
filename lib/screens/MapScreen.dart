// ignore: file_names
// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zap/screens/HomeScreen.dart';
import 'package:zap/src/locations.dart' as locations;
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MapScreen> {
  int _page = 0;
final _pageList = [
  Text('A'),
  Text('B'),
  Text('C'),
];

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
      for (final office in googleOffices.offices) {
        final marker = Marker(
          markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.lng),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
        );
        _markers[office.name] = marker;
      }
    });
  }

  // GoogleMap(
  //         onMapCreated: _onMapCreated,
  //         initialCameraPosition: const CameraPosition(
  //           target: LatLng(0, 0),
  //           zoom: 2,
  //         ),
  //         markers: _markers.values.toSet(),
  //       ),
  //     ),

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('EV Charging Locations'),
          backgroundColor: Colors.blue,
        ),
        body: _pageList[ _page],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _page,
          onTap: (int index){
            setState(() {
              _selectedTab = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text('Categories'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}
