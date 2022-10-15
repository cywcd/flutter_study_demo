// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'pages/bus_page.dart';
import 'pages/plane_page.dart';
import 'pages/mine_page.dart';

class GesturesWidget extends StatefulWidget {
  const GesturesWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _GesturesStateWidget();
  }
}

class _GesturesStateWidget extends State<GesturesWidget> {
  int currentIndex = 0;
  List pageList = [
    const BusPage(),
    const PlanePage(),
    const MinePage(),
  ];
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: const Text('GestureDetector 事件widget'),
        actions: [
          IconButton(
            tooltip: 'this is icon tip',
            icon: const Icon(Icons.tips_and_updates),
            onPressed: () => {},
          ),
        ],
      ),
      body: GestureDetector(
        child: Container(
          width: 300,
          height: 200,
          color: Colors.grey,
          child: const Text('GestureDetector 事件处理'),
        ),
        onTap: () {
          print('tap');
        },
        onDoubleTap: () {
          print('doubleTap');
        },
        onLongPress: () {
          print('longpress');
        },
        onScaleUpdate: (e) {
          print('scale update');
        },
      ),
    );
  }
}
