import 'package:flutter/material.dart';
<<<<<<< Updated upstream

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "demo",
      home: home(title: "Future Build EX"),
    );
  }
}

class home extends StatefulWidget {
  home({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("come data"),
            FutureBuilder(
              future: _fetch1(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData == false) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'Error : ${snapshot.error}',
                      style: TextStyle(fontSize: 15),
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      snapshot.data.toString(),
                      style: TextStyle(fontSize: 15),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
=======
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Weather.dart';

void main() => runApp(Imp());

class Imp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "weatherDemo",
      home: HomePage(title: 'Weather Demo HomePage'),
>>>>>>> Stashed changes
    );
  }
}

<<<<<<< Updated upstream
Future<String> _fetch1() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Call Data';
=======
class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Weather> getWeather() async {
    String apiAddr =
        "http://api.openweathermap.org/data/2.5/weather?q=seoul&APPID=d10e677cfa000cdc52db24c474925cd5&units=metric";
    http.Response response;
    var data1;
    Weather weather;
    try {
      response = await http.get(apiAddr);
      data1 = json.decode(response.body);
      weather = Weather(
        temp: data1["main"]["temp"],
        tempMax: data1["main"]["temp_max"],
        tempMin: data1["main"]["temp_min"],
        weatherMain: data1["weather"][0]["main"],
        code: data1["weather"][0]["id"],
      );
      print(weather.tempMin);
    } catch (e) {
      print(e);
    }
    return weather;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder(
          future: getWeather(),
          builder: (context, AsyncSnapshot<Weather> snapshot) {
            if (snapshot.hasData == false) {
              return CircularProgressIndicator();
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('현재온도 : ${snapshot.data.temp.toString()}'),
                Text('최저온도 : ${snapshot.data.tempMin.toString()}'),
                Text('최고온도 : ${snapshot.data.tempMax.toString()}'),
                snapshot.data.code == 800
                    ? Icon(Icons.wb_sunny)
                    : snapshot.data.code / 100 == 8 ||
                            snapshot.data.code / 100 == 2
                        ? Icon(Icons.wb_cloudy)
                        : snapshot.data.code / 100 == 3 ||
                                snapshot.data.code / 100 == 5
                            ? Icon(Icons.beach_access)
                            : snapshot.data.code / 100 == 6
                                ? Icon(Icons.ac_unit)
                                : Icon(Icons.cloud_circle)
              ],
            );
            // Text(snapshot.data.tempMax.toString());
          },
        ),
      ),
    );
  }
>>>>>>> Stashed changes
}
