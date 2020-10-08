
import 'package:geolocator/geolocator.dart';

class Location{
  double latitude;
  double longitude;
  Future getLocation() async {
    try{
      Position position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
      print("Loaded");
      print(latitude);
      print(longitude);
    }
    catch(e)
    {
      print("Nahi hua load");
      latitude = 0.0;
      longitude = 0.0;
    }
  }

}