import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logger/logger.dart';
import 'package:vehicle_management_app/data/sources/location_services.dart';
import 'package:vehicle_management_app/presentation/cubit/currentlocation/currentlocation_cubit.dart';
import 'package:vehicle_management_app/presentation/widgets/commonappbar.dart';
import 'package:vehicle_management_app/service_locator.dart';

class PickLocation extends StatefulWidget {
  const PickLocation({super.key});

  @override
  PickLocationState createState() => PickLocationState();
}

class PickLocationState extends State<PickLocation> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  CameraPosition? _initialCameraPosition;
  bool _mapLoaded = false;
  final TextEditingController _searchController = TextEditingController();
  final _debounce = const Duration(milliseconds: 500);
  Timer? _debounceTimer;

  final logger = Logger();

  void _onSearchChanged() {
    if (_debounceTimer?.isActive ?? false) _debounceTimer?.cancel();
    _debounceTimer = Timer(_debounce, () async {
      if (_searchController.text.isNotEmpty) {
        suggestions =
            await sl<LocationServices>().getSuggestions(_searchController.text);
        setState(() {});
      }
    });
  }

  _addMarker(LatLng latLng) {
    setState(() {
      markers.clear();
      markers.add(Marker(
        markerId: const MarkerId('1'),
        infoWindow: InfoWindow(title: _searchController.text),
        position: latLng,
      ));
    });
  }

  moveToLocation() async {
    var result = await sl<LocationServices>()
        .locationFromAddress(_searchController.text);
    if (result == "No locations found for the provided address") {
      logger.e(result);
      return;
    }
    var lat = result['latitude'];
    var lng = result['longitude'];
    _addMarker(LatLng(lat, lng));
    final GoogleMapController controller = await _controller.future;

    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(lat, lng),
        zoom: 100.0,
      ),
    ));
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  Set<Marker> markers = {};

  Future<void> _onMapCreated(GoogleMapController controller) async {
    _controller.complete(controller);
    setState(() {
      _mapLoaded = true;
    });
  }

  List suggestions = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    final currentLocationCubit = context.read<CurrentlocationCubit>();
    if (currentLocationCubit.state is! CurrentlocationLoaded) {
      currentLocationCubit.getCurrentLocation();
    } else {
      final state = currentLocationCubit.state as CurrentlocationLoaded;
      _initialCameraPosition = CameraPosition(
        target: LatLng(state.latitude, state.longitude),
        zoom: 100.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      appBar: const CommonAppBar(title: "Pick Location"),
      body: Stack(
        children: [
          // // Blurred background
          // BackdropFilter(
          //     filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          //     child: const SizedBox()),
          // Pop-up box
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: BlocBuilder<CurrentlocationCubit, CurrentlocationState>(
                builder: (context, state) {
                  if (state is CurrentlocationLoaded) {
                    _initialCameraPosition = CameraPosition(
                      target: LatLng(state.latitude, state.longitude),
                      zoom: 18.0,
                    );
                  }

                  return Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40.0),
                        child: _initialCameraPosition == null
                            ? const Center(child: CircularProgressIndicator())
                            : AnimatedOpacity(
                                opacity: _mapLoaded ? 1.0 : 0.0,
                                duration: const Duration(seconds: 1),
                                child: GoogleMap(
                                  onMapCreated: _onMapCreated,
                                  myLocationEnabled: true,
                                  myLocationButtonEnabled: true,
                                  compassEnabled: true,
                                  mapToolbarEnabled: true,
                                  mapType: MapType.normal,

                                  onTap: (argument) async {
                                    var latitude = argument.latitude;
                                    var longitude = argument.longitude;
                                    var coordinates =
                                        await sl<LocationServices>()
                                            .getPlaceMarkFromCoordinates(
                                                latitude, longitude);
                                    markers.clear();
                                    markers.add(Marker(
                                      markerId: const MarkerId('1'),
                                      infoWindow: InfoWindow(
                                        title: coordinates.name,
                                      ),
                                      position: argument,
                                    ));
                                    setState(() {});
                                  },
                                  markers: markers,
                                  padding: const EdgeInsets.only(
                                    top: 80.0,
                                    bottom: 20.0,
                                  ), // Adjust padding as needed
                                  initialCameraPosition:
                                      _initialCameraPosition!,
                                ),
                              ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: FloatingActionButton(
                            onPressed: () {
                              if (markers.isNotEmpty) {
                                Navigator.of(context).pop({
                                  'position': markers.first.position,
                                  'name': markers.first.infoWindow.title,
                                });
                              } else {
                                Navigator.of(context).pop();
                              }
                            },
                            child: const Icon(Icons.check),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 16,
                        left: 16,
                        right: 16,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 10.0,
                                offset: Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                trailing: _searchController.text.isNotEmpty
                                    ? IconButton(
                                        icon: const Icon(Icons.close),
                                        onPressed: () {
                                          suggestions.clear();
                                          _searchController.clear();
                                          markers.clear();
                                          FocusScope.of(context).unfocus();
                                          _searchController
                                              .addListener(_onSearchChanged);
                                          setState(() {});
                                        },
                                      )
                                    : null,
                                title: TextField(
                                  controller: _searchController,
                                  decoration: const InputDecoration(
                                    hintText: 'Search location',
                                    border: InputBorder.none,
                                    icon: Icon(Icons.search),
                                  ),
                                ),
                              ),
                              if (suggestions.isNotEmpty)
                                ListView.builder(
                                    padding: const EdgeInsets.all(0),
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: suggestions.length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        title: Text(
                                          suggestions[index]['description'],
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        onTap: () {
                                          _searchController
                                              .removeListener(_onSearchChanged);
                                          _searchController.text =
                                              suggestions[index]['description'];
                                          suggestions.clear();
                                          markers.clear();
                                          FocusScope.of(context).unfocus();
                                          moveToLocation();

                                          setState(() {});
                                        },
                                      );
                                    }),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
