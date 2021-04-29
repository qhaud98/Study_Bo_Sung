//https://www.youtube.com/watch?v=DNm9hHLKatA//
//유투브 참고!
//
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'dioserver.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              server.getReq();
            },
            child: Text('GET'),
            color: Colors.green[200],
          ),
          FlatButton(
            onPressed: () {},
            child: Text('POST'),
            color: Colors.green[200],
          ),
          FlatButton(
            onPressed: () {
              server.getReqWzQuery();
            },
            child: Text('GET with Query'),
            color: Colors.green[200],
          ),
        ],
      ),
    );
  }
}
