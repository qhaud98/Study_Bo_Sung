import 'package:flutter/material.dart';

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
    );
  }
}

Future<String> _fetch1() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Call Data';
}
