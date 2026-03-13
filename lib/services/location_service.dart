import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationService {
  static final LocationService _instance = LocationService._internal();

  factory LocationService() {
    return _instance;
  }

  LocationService._internal();

  Future<bool> requestLocationPermission() async {
    final status = await Permission.location.request();
    return status.isGranted;
  }

  Future<Position?> getCurrentLocation() async {
    try {
      final permission = await Permission.location.status;
      if (!permission.isGranted) {
        final result = await requestLocationPermission();
        if (!result) return null;
      }

      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      return position;
    } catch (e) {
      print('Error getting location: $e');
      return null;
    }
  }

  Future<double> calculateDistance(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) async {
    try {
      final distance = await Geolocator.distanceBetween(lat1, lon1, lat2, lon2);
      return distance / 1000; // Convert to kilometers
    } catch (e) {
      print('Error calculating distance: $e');
      return 0;
    }
  }

  bool isLocationEnabled() {
    return Geolocator.isLocationServiceEnabled();
  }
}