// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class PageParams extends StatelessWidget {
  final List _goodsList = [
    {"id": 1, "name": 'iphone'},
    {"id": 2, "name": 'huawei'},
    {"id": 3, "name": 'oppo'},
    {"id": 4, "name": 'xiaomi'},
  ];

  PageParams({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('第一个页面'),
      ),
      body: SizedBox(
        height: 400,
        child: ListView.builder(
          itemCount: _goodsList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_goodsList[index]['name']),
              onTap: () async {
                String result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPage(
                            _goodsList[index]['id'],
                            _goodsList[index]['name'])));
                // ignore: avoid_print
                print('result=>$result');
              },
            );
          },
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  int goodsId;
  String goodsName;
  DetailPage(this.goodsId, this.goodsName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('第二个页面'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text('goodsId: $goodsId'),
                Text('goodsName: $goodsName'),
                ElevatedButton(
                  child: const Text('返回'),
                  onPressed: () {
                    Navigator.pop(context, '这是来自于第二个页面的返回值,name: $goodsName');
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
