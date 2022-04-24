import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:greenhands_mobile/blocs/api/api_bloc.dart';
import 'package:greenhands_mobile/models/index.dart';
import 'package:greenhands_mobile/utils/pref_model.dart';


class MapTab extends StatefulWidget {
  const MapTab({Key? key}) : super(key: key);

  @override
  State<MapTab> createState() => MapTabState();
}

class MapTabState extends State<MapTab> {
  final Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _devLocation = CameraPosition(
    target: LatLng(
        PrefModel.instance.lat ?? 0, PrefModel.instance.lng ?? 0),
    zoom: 14.4746,
  );

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  MarkerId? selectedMarker;
  LatLng? markerPosition;

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
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



  @override
  Widget build(BuildContext context) {
    var apiBloc = BlocProvider.of<ApiBloc>(context);


    return BlocBuilder<ApiBloc, ApiState>(
      builder: (context, state) {
        if(state is ApiDataReady){
          final points = state.getValue<GenericListResponse<List<PointModel>>>();
          final organizers = state.getValue<GenericListResponse<List<ProfileModel>>>();

          debugPrint("${points?.count}");
          debugPrint("${organizers?.count}");

          for(ProfileModel item in organizers?.results ?? []){
            final markerId = MarkerId("${item.phone}");
            markers[markerId] = Marker(
                markerId: markerId, 
                position: LatLng(item.lat ?? 0, item.lng ?? 0),
                infoWindow: InfoWindow(
                  title: "${item.firstName} ${item.lastName}",
                ),
                icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
                onTap: () => _onMarkerTapped(markerId),

            );
          }

          for(PointModel item in points?.results ?? []){
            final markerId = MarkerId(item.name);
            markers[markerId] = Marker(markerId: markerId, position: LatLng(item.lat, item.lng),
            infoWindow: InfoWindow(
              title: item.name,
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
            onTap: () => _onMarkerTapped(markerId)
            );
          }


        }
        return GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _devLocation,
          onMapCreated: _onMapCreated,
          onCameraIdle: () async {
            final GoogleMapController controller = await _controller.future;
            final visibleRegion = await controller.getVisibleRegion();

            apiBloc.add(ApiRequest([
                  (client) => client.points(visibleRegion.southwest.latitude, visibleRegion.northeast.latitude, visibleRegion.southwest.longitude, visibleRegion.northeast.longitude),
                  (client) => client.organizers(visibleRegion.southwest.latitude, visibleRegion.northeast.latitude, visibleRegion.southwest.longitude, visibleRegion.northeast.longitude)
            ]));

          },
          markers: Set<Marker>.of(markers.values),
        );
      },
    );
  }


}