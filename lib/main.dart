import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('GetX demo'),
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                'a',
                style: TextStyle(fontSize: 60),
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.to(SecondPage());
                  },
                  child: Text('button')),
              ElevatedButton(
                  onPressed: () {
                    Get.snackbar(
                      '제목',
                      '안녕?',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  },
                  child: Text('snackbar')),
              ElevatedButton(
                  onPressed: () {
                    Get.defaultDialog(middleText: '밥줘');
                  },
                  child: Text('alant')),
              ElevatedButton(
                  onPressed: () {
                    Get.to(Tree());
                  },
                  child: Text('cupertino'))
            ],
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SecondPage'),
      ),
    );
  }
}

class Tree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
        ),
      ),
    );
  }
}
