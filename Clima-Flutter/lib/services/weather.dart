import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
const openWeatherURL = 'https://api.openweathermap.org/data/2.5/weather';
const appID = 'fd65729efa19773286ed081e2ebb56f1';
class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async{
    var url = '$openWeatherURL?q=$cityName&appid=$appID&units=metric';
    NetworkHelper helper = NetworkHelper(url);
    var weatherData = await helper.getData();
    return weatherData;
  }
  Future<dynamic> getWeatherData() async{
    Locator newLocator = Locator();
    await newLocator.getPosition();
    NetworkHelper helper = NetworkHelper('$openWeatherURL?lat=${newLocator.getLatitude()}&lon=${newLocator.getLongitude()}&appid=$appID&units=metric');
    final responseData = await helper.getData();
    return responseData;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
