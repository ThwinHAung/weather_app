import 'package:geolocator/geolocator.dart';

class Location {
  double? latitdude;
  double? longitue;
  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitdude = position.latitude;
      longitue = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
