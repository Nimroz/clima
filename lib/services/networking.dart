import 'package:clima/services/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataService{

  Future<WeatherResponse> getWeather(String city) async {

    //https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

    final queryParameter = {'q': city, 'appId': '8ce2caef7bf9265ca6d2ce3986cd1d72' ,'units': 'metric' };

    final uri = Uri.http('api.openweathermap.org','/data/2.5/weather', queryParameter);
    final response = await http.get(uri);
    print(response.body);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJason(json);
  }


}




// class NetworkHelper{
//
//   NetworkHelper(this.url);
//
//   final String url;
//
// Future getData() async {
//     http.Response response = await
//     http.get(Uri.parse(url));
//
//     if(response.statusCode == 200 ) {
//       String data = response.body;
//
//      return jsonDecode(data);
//     }
//       else{
//       print(response.statusCode);
//     }
//
//   }
//}



