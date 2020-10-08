import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Covidhelper{
   String url = "https://api.covidindiatracker.com/state_data.json";
  // String url = "http://api.weatherstack.com/current?access_key=2eb04cc20b40aa64e12e639a000ceb63&query=37.4219983,-122.084";
  Future getdata() async {
    print(url);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    else {
      print(response.statusCode);
    }
  }

}