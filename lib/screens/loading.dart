import 'package:covid_19app/services/covid-data.dart';
import 'package:flutter/material.dart';
import 'package:covid_19app/services/location.dart';
import 'Firstscreen.dart';
import 'package:covid_19app/services/location-data.dart';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double Lat;
  double Long;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }
  @override

  void getLocation() async
  {
    Location location = Location();
    await location.getLocation();
    Lat = location.latitude;
    Long = location.longitude;
    print("Location mill gaya"+ Lat.toString()+ " "+ Long.toString());
    // String url = "http://api.weatherstack.com/current?access_key=2eb04cc20b40aa64e12e639a000ceb63&query="+ Lat.toString()+","+Long.toString();
    String url = "https://us1.locationiq.com/v1/reverse.php?key=93cf2a0caf8c94&lat="+Lat.toString()+ "&lon=" + Long.toString() + "&format=json";
    Locationhelper locationHelper = Locationhelper(url: url);
    var weatherData = await locationHelper.getdata();
    Covidhelper covidHelper = Covidhelper();
    var data = await covidHelper.getdata();


    Navigator.push(context,MaterialPageRoute(builder: (context){
      return FirstScreen(locationData: weatherData,coviddata:data);
    }));
    // Navigator.push(context, MaterialPageRoute(builder: (context){
    //   return LocationScreen(locationData: weatherData);
    // }));
  }

  Widget build(BuildContext context) {
    return Container();
  }
}
