import 'package:dio/dio.dart';

const _API_PREFIX = 'https://jsonplaceholder.typicode.com/todos/1';

class Server {
  Future<void> getReq() async {
    Response response;
    Dio dio = new Dio();
    response = await dio.get("$_API_PREFIX");
    print(response.data.toString());
  }

  Future<void> getReqWzQuery() async {
    Response response;
    Dio dio = new Dio();
    response = await dio.get(_API_PREFIX, queryParameters: {"userId": 1});
    print(response.data.toString());
  }
}

Server server = Server();
