import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(RestApp());

class RestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [
              Icon(CupertinoIcons.drop),
              ElevatedButton(onPressed: () {}, child: Text("demo"))
            ],
          ),
        ),
      ),
    );
  }
}

void RestApi_Get() async {
  http.Response response = await http.get(
      Uri.encodeFull('https://github.com/qhaud98/sdf_project_0413'),
      headers: {"Accept": "application/json"});
  Map<String, dynamic> responseBodyMap = jsonDecode(response.body);
  print(response.body);
  print(responseBodyMap["restapi"]);
  debugPrint("restapi");
}

class JsonObject {
  final String restapi;
  JsonObject({this.restapi});
  factory JsonObject.fromJson(Map<String, dynamic> json) {
    return JsonObject(restapi: json['restapi'] as String);
  }
}
