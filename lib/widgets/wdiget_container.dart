import 'package:flutter/material.dart';

class WidgetContainer extends StatelessWidget {
  const WidgetContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Container'),
      ),
      // body: SizedBox(
      //   width: 400,
      //   height: 200,
      //   child: Container(
      //     color: Colors.red,
      //   ),
      // ),
      body: Column(
        children: [
          Container(
            color: Colors.blue,
            alignment: Alignment.centerRight,
            width: 300,
            height: 200,
            padding: const EdgeInsets.only(right: 20),
            child: const Text('C-1'),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            color: Colors.red,
            alignment: Alignment.centerRight,
            width: 200,
            height: 100,
            child: const Text('C-2'),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            color: Colors.red,
            alignment: Alignment.topLeft,
            width: 100,
            height: 50,
            child: const Text('C-3'),
          ),
        ],
      ),
    );
  }
}
