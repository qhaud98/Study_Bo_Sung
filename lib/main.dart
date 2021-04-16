import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Secure Storage',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyLoginPage(title: 'Secure Storage Login'),
    );
  }
}

class MyLoginPage extends StatefulWidget {
  MyLoginPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyLoginPage createState() => _MyLoginPage();
}

class _MyLoginPage extends State<MyLoginPage> {
  TextEditingController idController;
  TextEditingController passController;
  String userInfo = ""; //user의 정보를 저장하기 위한 변수

  static final storage =
      new FlutterSecureStorage(); //flutter_secure_storage 사용을 위한 초기화 작업
  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
    passController = TextEditingController();

    //비동기로 flutter secure storage 정보를 불러오는 작업.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    //read 함수를 통하여 key값에 맞는 정보를 불러오게 됩니다. 이때 불러오는 결과의 타입은 String 타입임을 기억해야 합니다.
    //(데이터가 없을때는 null을 반환을 합니다.)
    userInfo = await storage.read(key: "login");
    print(userInfo);

    //user의 정보가 있다면 바로 로그아웃 페이지로 넝어가게 합니다.
    if (userInfo != null) {
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(
          builder: (context) => LogOutPage(
            id: userInfo.split(" ")[1],
            pass: userInfo.split(" ")[3],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: idController,
                decoration: InputDecoration(labelText: "id"),
              ),
              TextField(
                controller: passController,
                decoration: InputDecoration(labelText: "password"),
              ),
              ElevatedButton(
                onPressed: () async {
                  // write 함수를 통하여 key에 맞는 정보를 적게 됩니다.
                  //{"login" : "id id_value password password_value"}
                  //와 같은 형식으로 저장이 된다고 생각을 하면 됩니다.
                  await storage.write(
                      key: "login",
                      value: "id " +
                          idController.text.toString() +
                          " " +
                          "password " +
                          passController.text.toString());

                  Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => LogOutPage(
                              id: idController.text,
                              pass: passController.text,
                            )),
                  );
                },
                child: Text("로그인"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LogOutPage extends StatefulWidget {
  //로그인 정보를 이전 페이지에서 전달 받기 위한 변수
  final String id;
  final String pass;
  LogOutPage({this.id, this.pass});
  @override
  _LogOutPage createState() => _LogOutPage();
}

class _LogOutPage extends State<LogOutPage> {
  static final storage = FlutterSecureStorage();
  //데이터를 이전 페이지에서 전달 받은 정보를 저장하기 위한 변수
  String id;
  String pass;
  @override
  void initState() {
    super.initState();
    id = widget.id; //widget.id는 LogOutPage에서 전달받은 id를 의미한다.
    pass = widget.pass; //widget.pass LogOutPage에서 전달받은 pass 의미한다.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Logout Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("id : " + id),
            Text("password : " + pass),
            ElevatedButton(
              onPressed: () {
                //delete 함수를 통하여 key 이름이 login인것을 완전히 폐기 시켜 버린다.
                //이를 통하여 다음 로그인시에는 로그인 정보가 없어 정보를 불러 올 수가 없게 된다.
                storage.delete(key: "login");
                Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => MyLoginPage(
                            title: "Login Page",
                          )),
                );
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
