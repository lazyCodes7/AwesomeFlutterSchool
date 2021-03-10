import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;
  @override

  void initState(){
    super.initState();
    getLocationData();
  }
  void getLocationData() async{
    WeatherModel model = WeatherModel();
    final weatherData = await model.getWeatherData();
    Navigator.push(this.context, MaterialPageRoute(builder: (context) {
      return LocationScreen(weatherData: weatherData,);
    }));

  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinKitDoubleBounce(
        color: Colors.blueGrey,
      ),

    );
  }
}
// double temp = jsonDecode(data)['main']['temp'];
// int id = jsonDecode(data)['weather'][0]['id'];
// String name = jsonDecode(data)['name'];