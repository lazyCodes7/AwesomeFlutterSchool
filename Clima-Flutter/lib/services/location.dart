import 'package:geolocator/geolocator.dart';
class Locator {
  double _latitudes;
  double _longitudes;

  Future<void> getPosition() async {
    try{
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      _longitudes = position.longitude;
      _latitudes = position.latitude;
    }catch(e){
      print("Permissions Denied/Disabled");
      _latitudes = 0.0;
      _longitudes = 0.0;
    }
  }
  double getLatitude(){
    return _latitudes;
  }
  double getLongitude(){
    return _longitudes;
  }

}