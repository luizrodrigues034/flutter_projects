import 'package:geolocator/geolocator.dart';

class Location {
  double? longitude;
  double? latitude;

  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );

  Future<void> getCurrentLocation() async {
    try {
      await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      );
      longitude = position.longitude;
      latitude = position.latitude;
    } catch (e) {
      print('Error getting location: $e');
    }
  }
}
