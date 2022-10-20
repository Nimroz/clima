import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
   LocationScreen({this.locationWeather});
   final locationWeather;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  late double temperature;
  late int condition;
  late String cityName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUi(widget.locationWeather);
  }

  void updateUi(dynamic weatherData){
    var temp  = weatherData['main']['temp'];
    temperature = temp.toInt();
    condition = weatherData['weather'][0]['id'];
    cityName = weatherData['name'];

  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'images/location_background.jpg'
                ),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(.8), BlendMode.dstATop),
              ),
            ),
            constraints: BoxConstraints.expand(),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(onPressed: (){},
                      child: Icon(
                        Icons.near_me,
                        size: 50.0,
                      ),
                  ),
                  ElevatedButton(onPressed: (){},
                      child: Icon(
                        Icons.location_city,
                        size: 50.0,
                      )
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: [
                      Text(
                        '$temperature',
                      ),
                      Text(
                        '*',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(right: 15.0),
                    child: Text(
                      'Its IceCream Tym in San Francisco!',
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    }
