// ignore_for_file: avoid_print
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioDemoPage extends StatefulWidget {
  const DioDemoPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DioDemoPage();
  }
}

class _DioDemoPage extends State<DioDemoPage> {
  late String _data = '';
  final Dio dio = Dio();

  @override
  Widget build(BuildContext context) {
    dio.options.baseUrl =
        'https://www.fastmock.site/mock/b55ebcfe7e6f6de09f33b493894dc724/study';
    dio.options.connectTimeout = 1000;
    return Scaffold(
      appBar: AppBar(
        title: const Text('dio http request'),
      ),
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  _data = '';
                });
                Response res = await dio.get('/server/v1.0/list',
                    queryParameters: {"username": 'alas'});
                // dio.post('https://www.badu.com', data: {"username": 'alas'});
                // dio.download('https://www.badu.com/logo.png', savePath);
                print('result:${res.data}');
                setState(() {
                  _data = res.data.toString();
                });
              },
              child: const Text('发起网络访问'),
            ),
            ElevatedButton(
              onPressed: () => _try(),
              child: const Text('异常处理'),
            ),
            Scrollbar(
                child: SizedBox(
              height: 400,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('响应结果：',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      _data,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }

  void _try() async {
    try {
      print("object");
      dynamic result = await dio
          .get('/server/v1.0/list', queryParameters: {"username": 'alas'});
      print(result);
      throw ('异常测试');
    } catch (e) {
      print(e.toString());
    }
  }
}
