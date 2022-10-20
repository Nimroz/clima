import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/models.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = '8ce2caef7bf9265ca6d2ce3986cd1d72';

class LoadingScreen extends StatefulWidget {


  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  
 //  @override
 //  void initState() {
 //    // TODO: implement initState
 //    super.initState();
 //    getLocationData();
 //  }
 //
 //  void getLocationData() async {
 // Location location = Location();
 // await location.getCurrentLocation();
 //
 //
 //
 //   NetworkHelper networkHelper = NetworkHelper
 //     ('https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metrics');
 //
 //    var weatherData = await networkHelper.getData();
 //
 //    Navigator.push(context, MaterialPageRoute(builder: (context){
 //      return LocationScreen(
 //        locationWeather: weatherData,
 //      );
 //     }));
 //  }

  final _cityTextController  = TextEditingController();
  final _dataService = DataService();
  WeatherResponse? _response;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage(
        'images/Rectangle2.png'
    ),
    fit: BoxFit.cover,
    colorFilter: ColorFilter.mode(
    Colors.white.withOpacity(.8), BlendMode.dstATop),
    ),
    ),
    constraints: BoxConstraints.expand(),

        // child: SpinKitDoubleBounce(
        //   color: Colors.white,
        //   size: 100.0,
        // ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_response != null)
                Column(
                  children: [
                    Text(
                      '${_response!.tempInfo.temperature}°',
                      style: TextStyle(fontSize: 40),
                    ),
                    Text(_response!.weatherInfo.description)
                  ],
                ),
              TextField(
                controller: _cityTextController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter City Name',
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                  onPressed: _search, child: Text('Search'),),
            ],
          ),
        ),
      ),
    );
  }

  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    setState(() {
      _response = response;
    });
  }
}
