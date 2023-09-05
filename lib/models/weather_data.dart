// ignore_for_file: public_member_api_docs, sort_constructors_first
class WeatherData {
  String name;
  String region;
  String country;
  String localTime;
  String lastUpdated;
  double tempC;
  double tempF;
  int    isDay;
  String condition;
  String iconCondition;
  double windDegree;
  double humidity;
  double uv;

  WeatherData({
    required this.name,
    required this.region,
    required this.country,
    required this.localTime,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.iconCondition,
    required this.windDegree,
    required this.humidity,
    required this.uv,
  });
}
