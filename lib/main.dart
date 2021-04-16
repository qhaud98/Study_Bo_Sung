import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(Imp());

class Imp extends StatelessWidget {
  var ID, Ps1, Ps2;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<String>.value(value: '$ID'),
        Provider<String>.value(value: '$Ps1'),
        Provider<String>.value(value: '$Ps2'),
      ],
      child: MaterialApp(
        title: "Login Demo",
        initialRoute: '/LoginPage',
        routes: {
          '/LoginPage': (context) => LoginPage(),
          '/HomePage': (context) => HomePage(),
        },
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var IDdata;
  var ID;
  @override
  Widget build(BuildContext context) {
    ID = Provider.of<String>(context, listen: false);
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(hintText: "ID"),
                onSubmitted: (String IDdata) {
                  setState(() {
                    ID = IDdata;
                  });
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/HomePage');
                  },
                  child: Text('$ID'))
            ],
          ),
        ),
      ),
    ));
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var IDdata;

  var ID;

  @override
  Widget build(BuildContext context) {
    IDdata = Provider.of<String>(context, listen: false);
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("YOUR ID : $IDdata"),
        ),
      ),
    );
  }
}
