
class WeatherInfo{

  final String description;
  WeatherInfo({required this.description});

 factory WeatherInfo.fromJson(Map<String, dynamic> json){

   final description = json['description'];
   return WeatherInfo(description: description);
 }
}

class TemperatureInfo{
final int temperature;

  TemperatureInfo({ required this.temperature});

  factory TemperatureInfo.fromJson(Map<String, dynamic> json){
    final temperature = json['temp'].toInt();
    return TemperatureInfo(temperature: temperature);
}
}

class WeatherResponse{
  final String cityName;
  final TemperatureInfo tempInfo;
  final WeatherInfo weatherInfo;

  WeatherResponse({required this.cityName, required this.weatherInfo,required this.tempInfo});

  factory WeatherResponse.fromJason(Map<String, dynamic> json){
    final cityName = json['name'];

    final tempInfoJson = json['main'];
    final tempInfo = TemperatureInfo.fromJson(tempInfoJson);

    final weatherInfoJson = json['weather'][0];
    final weatherInfo = WeatherInfo.fromJson(weatherInfoJson);

    return WeatherResponse(cityName: cityName, tempInfo: tempInfo, weatherInfo: weatherInfo);
  }
}