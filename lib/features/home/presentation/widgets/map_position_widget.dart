import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Reusable map widget for viewing or picking a specific geographic position.
class MapPositionWidget extends StatefulWidget {
  /// Target geographic coordinates.
  final LatLng? position;

  /// Callback when map is tapped.
  final ValueChanged<LatLng>? onTap;

  /// Creates a [MapPositionWidget].
  const MapPositionWidget({
    this.position,
    this.onTap,
    super.key,
  });

  @override
  State<MapPositionWidget> createState() => _MapPositionWidgetState();
}

class _MapPositionWidgetState extends State<MapPositionWidget> {
  GoogleMapController? _controller;
  final Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};

  @override
  void initState() {
    super.initState();
    _updateMarker();
  }

  @override
  void didUpdateWidget(covariant MapPositionWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.position != oldWidget.position) {
      _updateMarker();
    }
  }

  void _updateMarker() {
    if (widget.position != null) {
      const markerId = MarkerId('selected_point');
      final marker = Marker(
        markerId: markerId,
        position: widget.position!,
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueMagenta,
        ),
      );
      setState(() {
        _markers[markerId] = marker;
      });

      _controller?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: widget.position!, zoom: 15),
        ),
      );
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
    _updateMarker();
  }

  @override
  Widget build(BuildContext context) {
    final initialPos = widget.position ?? const LatLng(0, 0);

    return Container(
      padding: const EdgeInsets.all(8.0),
      child: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: initialPos, zoom: 12),
        markers: Set<Marker>.of(_markers.values),
        mapToolbarEnabled: false,
        zoomControlsEnabled: false,
        onTap: widget.onTap,
      ),
    );
  }
}
