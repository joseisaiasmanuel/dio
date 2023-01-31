import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> calbeckBeck() async {
    Map<String, dynamic> body = {
      'title': 'teste',
      'body': 'conteudo',
      'userId': 1,
    };
    Map<String, String> headers = {'Content-Type': 'aplication/json'};

    final dio = Dio();

    try {
      Response response = await dio.post(
        'https://jsonplaceholder.typicode.com/posts',
        options: Options(headers: headers),
        data: body,
      );
      print(response.data);
    } on DioError catch (e) {
      print('erro na requeste ${e.response?.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    calbeckBeck();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Text de requisições"),
          centerTitle: true,
        ),
        body: const Center(
          child: Text("Text http",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
