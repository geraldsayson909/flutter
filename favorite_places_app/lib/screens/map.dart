import 'package:favorite_places_app/model/place.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key, required this.location, this.isSeleting = true});

  final PlaceLocation location;
  final bool isSeleting;

  @override
  State<MapScreen> createState() {
    return _MapScreenState();
  }
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _pickedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isSeleting ? 'Pick your Location' : 'Your Location'),
        actions: [
          if (widget.isSeleting)
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                Navigator.of(context).pop(_pickedLocation);
              },
            ),
        ],
      ),
      body: GoogleMap(
        onTap: !widget.isSeleting
            ? null
            : (position) {
                setState(() {
                  _pickedLocation = position;
                });
              },
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.location.latitude, widget.location.longitude),
          zoom: 16,
        ),
        markers: (_pickedLocation == null && widget.isSeleting)
            ? {
                Marker(
                  markerId: const MarkerId('default location'),
                  position: _pickedLocation ??
                      LatLng(
                          widget.location.latitude, widget.location.longitude),
                ),
              }
            : {
                Marker(
                  markerId: const MarkerId('pick location'),
                  position: _pickedLocation ??
                      LatLng(
                          widget.location.latitude, widget.location.longitude),
                ),
              },
      ),
    );
  }
}
