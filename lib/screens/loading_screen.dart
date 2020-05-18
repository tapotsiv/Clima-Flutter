import 'dart:convert';
import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const apiKey = '44cff76050cb309e732ff211f8b7c670';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location M@ = Location();
    await location.getCurrentPosition();
    latitude = location.latitude;
    longitude = location.longitude;
    print(latitude);
    print(longitude);

    getData();
  }

  void getData() async {
    http.Response response = await http.get(
        'http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    if (response.statusCode == 200) {
      String data = response.body;
      var decodeData = jsonDecode(data);

      double temperature = decodeData['main']['temp'];
      int weatherID = decodeData['weather'][0]['id'];
      String cityName = decodeData['name'];
      //this is to convert the temp from kelvin to ceslsius
      double convertTemp = temperature - 273.15;

      print(convertTemp);
      print(weatherID);
      print(cityName);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
