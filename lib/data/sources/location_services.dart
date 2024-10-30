import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:logger/logger.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class LocationServices {
  final Location location = Location();
  final Dio _dio = Dio();
  // ignore: non_constant_identifier_names
  String PLACES_API_KEY = dotenv.env['PLACES_API_KEY']!;
  CancelToken? _cancelToken;

  Future<bool> isLocationServiceEnabled() async {
    return await location.serviceEnabled();
  }

  Future<void> requestService() async {
    await location.requestService();
  }

  Future<PermissionStatus> isPermissionGranted() async {
    return await location.hasPermission();
  }

  Future<LocationData> getCurrentLocation() async {
    return await location.getLocation();
  }

  getSuggestions(String query) async {
    try {
      // Cancel the previous request if it's still ongoing
      _cancelToken?.cancel();
      _cancelToken = CancelToken();

      String baseURL =
          'https://maps.googleapis.com/maps/api/place/queryautocomplete/json';
      String request = '$baseURL?input=$query&key=$PLACES_API_KEY';

      var response = await _dio.get(request, cancelToken: _cancelToken);

      if (response.statusCode == 200) {
        return response.data['predictions'] as List;
      } else {
        throw Exception('Failed to load predictions');
      }
    } catch (e) {
      if (CancelToken.isCancel(
          DioException(requestOptions: RequestOptions(path: '')))) {
        debugPrint('Request canceled: $e');
      } else {
        debugPrint('Error: $e');
      }
    }
  }

  Future<geocoding.Placemark> getPlaceMarkFromCoordinates(
      double latitude, double longitude) async {
    List<geocoding.Placemark> placemarks =
        await geocoding.placemarkFromCoordinates(latitude, longitude);
    return placemarks[0];
  }

  Future<dynamic> locationFromAddress(String address) async {
    List<geocoding.Location> locations =
        await geocoding.locationFromAddress(address);
    if (locations.isNotEmpty) {
      return {
        'latitude': locations[0].latitude,
        'longitude': locations[0].longitude,
      };
    } else {
      return 'No locations found for the provided address';
    }
  }

  Future<dynamic> getDirections(String origin, String destination) async {
    try {
      final response = await _dio.get(
          'https://maps.googleapis.com/maps/api/directions/json?origin=$origin&destination=$destination&mode=driving&key=$PLACES_API_KEY');

      Logger().i(response.data);
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      Logger().e(e);
    }

    return {};
  }
}
