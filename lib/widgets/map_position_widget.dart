import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:greenhands_mobile/blocs/api/api_bloc.dart';
import 'package:greenhands_mobile/blocs/generic/generic_bloc.dart';
import 'package:greenhands_mobile/models/index.dart';


class MapPositionWidget extends StatefulWidget {
  MapPositionWidget({this.position, this.onTab, Key? key}) : super(key: key);

  LatLng? position;
  Function(LatLng)? onTab;

  @override
  State<MapPositionWidget> createState() => _MapPositionWidgetState();
}

class _MapPositionWidgetState extends State<MapPositionWidget> {
  GoogleMapController? controller;

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  @override
  Widget build(BuildContext context) {
    void _onMapCreated(GoogleMapController controller) {
      this.controller = controller;

    }

    void setupMap(GoogleMapController controller){
      if(widget.position != null){
        controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: widget.position!, zoom: 15),
          ),
        );
        const MarkerId markerId = MarkerId("my_point");

        final marker = Marker(
          markerId: markerId,
          position: widget.position!,
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueMagenta),
        );
        setState(() {
          markers[markerId] = marker;
        });

      }
    }
    if(controller != null){
      setupMap(controller!);
      debugPrint("got called");
    }


    return Container(
      padding: const EdgeInsets.all(8.0),
      child: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: const CameraPosition(target: LatLng(0, 0)),
        markers: Set<Marker>.of(markers.values),
        mapToolbarEnabled: false,
        zoomControlsEnabled: false,
        onTap: widget.onTab,
      ),
    );
  }
}
