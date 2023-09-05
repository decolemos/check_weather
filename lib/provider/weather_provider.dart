import 'dart:convert';
import 'dart:developer';
import 'package:check_temperature/models/weather_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherProvider extends ChangeNotifier {

  final String url = "http://api.weatherapi.com/v1/current.json?key=21d97d68e4844364bf4225107230409&q=jaragua do sul&aqi=no";

  Future<WeatherData> getTemperature() async {
    final response = await http.get(Uri.parse(url));

    log(response.statusCode.toString());
    log(response.body);

    if(response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final weatherData = WeatherData(
        name: jsonResponse["location"]["name"], 
        region: jsonResponse["location"]["region"], 
        country: jsonResponse["location"]["country"], 
        localTime: jsonResponse["location"]["localtime"], 
        lastUpdated: jsonResponse["current"]["last_updated"], 
        tempC: jsonResponse["current"]["temp_c"], 
        tempF: jsonResponse["current"]["temp_f"], 
        isDay: jsonResponse["current"]["is_day"], 
        condition: jsonResponse["current"]["condition"]["text"], 
        iconCondition: jsonResponse["current"]["condition"]["icon"], 
        windDegree: jsonResponse["current"]["wind_degree"], 
        humidity: jsonResponse["current"]["humidity"], 
        uv: jsonResponse["current"]["uv"]
      );
      return weatherData;
    } else {
      throw Exception("Erro ao buscar clima: ${response.statusCode}");
    }
  }

}