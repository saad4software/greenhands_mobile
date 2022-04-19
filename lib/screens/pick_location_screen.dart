import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:greenhands_mobile/blocs/api/api_bloc.dart';
import 'package:greenhands_mobile/extensions/widget_extension.dart';
import 'package:greenhands_mobile/models/index.dart';

class PickLocationScreen extends StatefulWidget {
  const PickLocationScreen({Key? key}) : super(key: key);


  @override
  State<StatefulWidget> createState() => PickLocationScreenState();
}

typedef MarkerUpdateAction = Marker Function(Marker marker);

class PickLocationScreenState extends State<PickLocationScreen> {
  PickLocationScreenState();

  ApiBloc? apiBloc;

  static const LatLng center = LatLng(-33.86711, 151.1947171);

  GoogleMapController? controller;

  // Location _location = Location();
  // Position currentLocation;

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  MarkerId? selectedMarker;
  LatLng? markerPosition;


  void _onMapCreated(GoogleMapController controller) {
    this.controller = controller;
    apiBloc?.add(ApiRequest([(repository) => repository.geoLocation()]));
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onMarkerTapped(MarkerId markerId) {
    final Marker? tappedMarker = markers[markerId];
    if (tappedMarker != null) {
      setState(() {
        final MarkerId? previousMarkerId = selectedMarker;
        if (previousMarkerId != null && markers.containsKey(previousMarkerId)) {
          final Marker resetOld = markers[previousMarkerId]!
              .copyWith(iconParam: BitmapDescriptor.defaultMarker);
          markers[previousMarkerId] = resetOld;
        }
        selectedMarker = markerId;
        final Marker newMarker = tappedMarker.copyWith(
          iconParam: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueGreen,
          ),
        );
        markers[markerId] = newMarker;

        markerPosition = null;
      });
    }
  }

  _handleTap(LatLng point) {
    const MarkerId markerId = MarkerId("my_point");

    final marker = (Marker(
      markerId: MarkerId(point.toString()),
      position: point,
      infoWindow: const InfoWindow(
        title: 'At this exact point',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
      onTap: () => _onMarkerTapped(markerId),

    ));


    setState(() {
      markers[markerId] = marker;
    });
  }


  @override
  Widget build(BuildContext context) {
    apiBloc = BlocProvider.of<ApiBloc>(context);


    final MarkerId? selectedId = selectedMarker;
    return Scaffold(
      appBar: AppBar(
        title: const Text("pick_location"),
        actions: [ElevatedButton(child: Text("save"), onPressed: (){
          LatLng? myPoint = markers[MarkerId("my_point")]?.position;
          if(myPoint != null){
            Navigator.pop(context, myPoint);
          }else {
            widget.toast(context, "Please pick location");

          }
        })],
      ),
      body: Stack(children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: BlocListener<ApiBloc, ApiState>(
                  listener: (context, state) {
                    if(state is ApiDataReady){
                      GeoLocationResponse response = state.getValue();
                      controller?.animateCamera(
                        CameraUpdate.newCameraPosition(
                          CameraPosition(target: LatLng(response.lat, response.lon),zoom: 10),
                        ),
                      );
                    }
                  },
                  child: GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: const CameraPosition(target: LatLng(0, 0)),
                    markers: Set<Marker>.of(markers.values),
                    myLocationEnabled: true,
                    onTap: _handleTap,
                  ),
                )
            ),
          ],
        ),
        Visibility(
          visible: markerPosition != null,
          child: Container(
            color: Colors.white70,
            height: 30,
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                if (markerPosition == null)
                  Container()
                else
                  Expanded(child: Text('lat: ${markerPosition!.latitude}')),
                if (markerPosition == null)
                  Container()
                else
                  Expanded(child: Text('lng: ${markerPosition!.longitude}')),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

