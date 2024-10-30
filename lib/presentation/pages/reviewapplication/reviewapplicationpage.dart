import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logger/logger.dart';
import 'package:vehicle_management_app/data/models/user/user_application.dart';
import 'package:vehicle_management_app/data/sources/location_services.dart';
import 'package:vehicle_management_app/presentation/widgets/commonappbar.dart';
import 'package:vehicle_management_app/service_locator.dart';

class ReviewApplicationPage extends StatefulWidget {
  const ReviewApplicationPage({super.key, required this.application});

  final UserApplication application;

  @override
  State<ReviewApplicationPage> createState() => _ReviewApplicationPageState();
}

class _ReviewApplicationPageState extends State<ReviewApplicationPage> {
  dynamic directions;

  @override
  void initState() {
    super.initState();
    Logger().i('Source Coordinates: ${widget.application.sourceCoordinates}');
    Logger().i(
        'Destination Coordinates: ${widget.application.destinationCoordinates}');
    getDirections();
  }

  getDirections() async {
    final response = await sl<LocationServices>().getDirections(
      "${widget.application.sourceCoordinates[0]},${widget.application.sourceCoordinates[1]}",
      "${widget.application.destinationCoordinates[0]},${widget.application.destinationCoordinates[1]}",
    );

    final Map<String, dynamic> data = response;
    final List<LatLng> polylineCoordinates = [];

    if (data['routes'] != null && data['routes'].isNotEmpty) {
      final route = data['routes'][0];
      if (route['legs'] != null && route['legs'].isNotEmpty) {
        final leg = route['legs'][0];
        if (leg['steps'] != null && leg['steps'].isNotEmpty) {
          for (var step in leg['steps']) {
            final startLocation = step['start_location'];
            final endLocation = step['end_location'];
            polylineCoordinates
                .add(LatLng(startLocation['lat'], startLocation['lng']));
            polylineCoordinates
                .add(LatLng(endLocation['lat'], endLocation['lng']));
          }
        }
      }
    }

    setState(() {
      directions = polylineCoordinates;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: 'Preview Application',
        // backgroundColor: Colors.teal,
        // titleTextStyle: TextStyle(
        //   color: Colors.white,
        //   fontSize: 20,
        //   fontWeight: FontWeight.bold,
        // ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: directions == null
                  ? const Center(child: CircularProgressIndicator())
                  : GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(widget.application.sourceCoordinates[0],
                            widget.application.sourceCoordinates[1]),
                        zoom: 12,
                      ),
                      polygons: {
                        Polygon(
                          polygonId: const PolygonId('source'),
                          points: [
                            LatLng(widget.application.sourceCoordinates[0],
                                widget.application.sourceCoordinates[1]),
                            LatLng(
                                widget.application.sourceCoordinates[0] + 0.001,
                                widget.application.sourceCoordinates[1] +
                                    0.001),
                            LatLng(
                                widget.application.sourceCoordinates[0] + 0.001,
                                widget.application.sourceCoordinates[1] -
                                    0.001),
                            LatLng(
                                widget.application.sourceCoordinates[0],
                                widget.application.sourceCoordinates[1] -
                                    0.001),
                          ],
                          strokeWidth: 2,
                          strokeColor: Colors.red,
                          fillColor: Colors.red.withOpacity(0.3),
                        ),
                        Polygon(
                          polygonId: const PolygonId('destination'),
                          points: [
                            LatLng(widget.application.destinationCoordinates[0],
                                widget.application.destinationCoordinates[1]),
                            LatLng(
                                widget.application.destinationCoordinates[0] +
                                    0.001,
                                widget.application.destinationCoordinates[1] +
                                    0.001),
                            LatLng(
                                widget.application.destinationCoordinates[0] +
                                    0.001,
                                widget.application.destinationCoordinates[1] -
                                    0.001),
                            LatLng(
                                widget.application.destinationCoordinates[0],
                                widget.application.destinationCoordinates[1] -
                                    0.001),
                          ],
                          strokeWidth: 2,
                          strokeColor: Colors.green,
                          fillColor: Colors.green.withOpacity(0.3),
                        ),
                      },
                      polylines: {
                        Polyline(
                          polylineId: const PolylineId('route'),
                          points: directions ?? [],
                          color: Colors.blue,
                          width: 5,
                        ),
                      },
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(color: Colors.grey, width: 0.5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoRow(Icons.location_on, 'Source',
                          widget.application.sourceName),
                      _buildInfoRow(Icons.location_on, 'Destination',
                          widget.application.destinationName),
                      _buildInfoRow(Icons.calendar_today, 'Date',
                          widget.application.date),
                      _buildInfoRow(
                          Icons.access_time, 'Time', widget.application.time),
                      _buildInfoRow(
                          Icons.check_circle,
                          'Status',
                          (widget.application.accepted == 'true')
                              ? 'Accepted'
                              : 'Pending'),
                      _buildInfoRow(Icons.person, 'Driver ID',
                          widget.application.driverId),
                      _buildInfoRow(Icons.directions_car, 'Vehicle ID',
                          widget.application.vehicleId),
                      // _buildInfoRow(Icons.access_time, 'Created At',
                      //     widget.application.createdAt.split('.').first),
                      _buildInfoRow(
                          Icons.repeat,
                          'Round Trip',
                          widget.application.roundTrip == 'true'
                              ? 'Yes'
                              : 'No'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Download logic here
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Not yet implemented'),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                  icon: const Icon(Icons.download, color: Colors.white),
                  label: const Text('Download',
                      style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Submit logic here
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Not yet implemented'),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                  icon: const Icon(Icons.send, color: Colors.white),
                  label: const Text('Submit',
                      style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.teal, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black87, fontSize: 16),
                children: [
                  TextSpan(
                    text: '$label: ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: value),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
