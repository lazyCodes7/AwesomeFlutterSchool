import 'package:clima/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
class LocationScreen extends StatefulWidget {

  final weatherData;

  const LocationScreen({Key key, this.weatherData}) : super(key: key);
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temperature;
  String cityName;
  String conditionIcon;
  WeatherModel weather = WeatherModel();
  String tempMessage;
  @override
  void initState(){
    super.initState();
    updateUI(widget.weatherData);
  }
  void updateUI(dynamic weatherData){
    setState(() {
      if(weatherData == null){
        temperature = 0;
        conditionIcon = 'error';
        tempMessage = "Unable to fetch data";
        cityName = "Not Found";
        return;
      }
      final temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      cityName = weatherData['name'];
      int condition = weatherData['weather'][0]['id'];
      conditionIcon = weather.getWeatherIcon(condition);
      tempMessage = weather.getMessage(temperature);
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var weatherData = await weather.getWeatherData();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var enteredName = await Navigator.push(context, MaterialPageRoute(builder: (context) => CityScreen()));
                      if(enteredName!=null){
                        var cityWeatherData = await weather.getCityWeather(enteredName);
                        updateUI(cityWeatherData);
                      }

                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      conditionIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$tempMessage in $cityName!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
