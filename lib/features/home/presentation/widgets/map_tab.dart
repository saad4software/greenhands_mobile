import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/utils/pref_model.dart';
import '../../../points/presentation/bloc/points_bloc.dart';
import '../../../points/presentation/bloc/points_event.dart';
import '../../../points/presentation/bloc/points_state.dart';

/// Tab widget rendering interactive Google Map with collection points & organizers.
class MapTab extends StatefulWidget {
  /// Creates a [MapTab].
  const MapTab({super.key});

  @override
  State<MapTab> createState() => MapTabState();
}

/// State implementation for [MapTab].
class MapTabState extends State<MapTab> {
  final Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _defaultLocation = CameraPosition(
    target: LatLng(
      PrefModel.instance.lat ?? 0.0,
      PrefModel.instance.lng ?? 0.0,
    ),
    zoom: 14.4746,
  );

  final Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};
  MarkerId? _selectedMarker;

  void _onMapCreated(GoogleMapController controller) {
    if (!_controller.isCompleted) {
      _controller.complete(controller);
    }
  }

  void _onMarkerTapped(MarkerId markerId) {
    final Marker? tappedMarker = _markers[markerId];
    if (tappedMarker != null) {
      setState(() {
        final MarkerId? previousMarkerId = _selectedMarker;
        if (previousMarkerId != null &&
            _markers.containsKey(previousMarkerId)) {
          final Marker resetOld = _markers[previousMarkerId]!.copyWith(
            iconParam: BitmapDescriptor.defaultMarker,
          );
          _markers[previousMarkerId] = resetOld;
        }
        _selectedMarker = markerId;
        final Marker newMarker = tappedMarker.copyWith(
          iconParam: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueGreen,
          ),
        );
        _markers[markerId] = newMarker;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PointsBloc>(
      create: (_) => sl<PointsBloc>(),
      child: Builder(
        builder: (context) {
          final pointsBloc = BlocProvider.of<PointsBloc>(context);

          return BlocBuilder<PointsBloc, PointsState>(
            builder: (context, state) {
              if (state is PointsLoaded) {
                _markers.clear();

                for (final organizer in state.organizers) {
                  if (organizer.lat != null && organizer.lng != null) {
                    final markerId = MarkerId(
                      'org_${organizer.phone ?? organizer.displayName}',
                    );
                    _markers[markerId] = Marker(
                      markerId: markerId,
                      position: LatLng(organizer.lat!, organizer.lng!),
                      infoWindow: InfoWindow(
                        title: organizer.displayName,
                        snippet: organizer.phone ?? 'Organizer',
                      ),
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueAzure,
                      ),
                      onTap: () => _onMarkerTapped(markerId),
                    );
                  }
                }

                for (final point in state.points) {
                  final markerId = MarkerId('point_${point.id}_${point.name}');
                  _markers[markerId] = Marker(
                    markerId: markerId,
                    position: LatLng(point.lat, point.lng),
                    infoWindow: InfoWindow(
                      title: point.name,
                      snippet: point.address,
                    ),
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueMagenta,
                    ),
                    onTap: () => _onMarkerTapped(markerId),
                  );
                }
              }

              return Stack(
                children: [
                  GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: _defaultLocation,
                    onMapCreated: _onMapCreated,
                    onCameraIdle: () async {
                      if (_controller.isCompleted) {
                        final controller = await _controller.future;
                        final visibleRegion =
                            await controller.getVisibleRegion();
                        pointsBloc.add(
                          FetchMapDataEvent(
                            minLat: visibleRegion.southwest.latitude,
                            maxLat: visibleRegion.northeast.latitude,
                            minLng: visibleRegion.southwest.longitude,
                            maxLng: visibleRegion.northeast.longitude,
                          ),
                        );
                      }
                    },
                    markers: Set<Marker>.of(_markers.values),
                  ),
                  if (state is PointsLoading)
                    const Positioned(
                      top: 16,
                      right: 16,
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2.5),
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
