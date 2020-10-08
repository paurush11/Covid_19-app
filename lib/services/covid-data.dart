import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Covidhelper{
  String url = "https://api.covidindiatracker.com/state_data.json";
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
