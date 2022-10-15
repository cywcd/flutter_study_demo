// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioDataView extends StatefulWidget {
  const DioDataView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DioDataView();
  }
}

class _DioDataView extends State<DioDataView> {
  late List _resData = [];
  Dio dio = Dio();

  @override
  void initState() {
    super.initState();
    dio.options.baseUrl =
        'https://www.fastmock.site/mock/b55ebcfe7e6f6de09f33b493894dc724/study';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dio http data view'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              Response res = await dio.get('/server/v1.0/list');
              setState(() {
                _resData = res.data["data"];
              });
              print('结果：$_resData');
              Response res1 = await dio.put('/update', queryParameters: {
                'id': '002',
              });
              print('put返回$res1');
            },
            child: const Text('请求接口'),
          ),
          SizedBox(
            height: 200,
            child: ListView(
              padding: const EdgeInsets.all(15),
              children: _resData
                  .map((item) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 30,
                            child: Text(item['title']),
                          ),
                          SizedBox(
                            height: 30,
                            child: Text(item['score']),
                          )
                        ],
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
