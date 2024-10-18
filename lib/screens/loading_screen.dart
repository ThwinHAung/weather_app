import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wather/screens/location_screen.dart';
import 'package:wather/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // ignore: non_constant_identifier_names
  // double? Longitude;
  // ignore: non_constant_identifier_names
  // double? Latitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
    // print('this line code is triggered');
  }

  void getLocationData() async {
    // LocationPermission permission;
    // permission = await Geolocator.checkPermission();
    // permission = await Geolocator.requestPermission();
    // if (permission == LocationPermission.denied) {
    //   //nothing
    // }
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
