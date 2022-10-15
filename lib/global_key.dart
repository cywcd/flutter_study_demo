// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'pages/bus_page.dart';
import 'pages/plane_page.dart';
import 'pages/mine_page.dart';

class GlobalKeyContext extends StatefulWidget {
  const GlobalKeyContext({super.key});

  @override
  State<StatefulWidget> createState() {
    return _GlobalKeyContext();
  }
}

class _GlobalKeyContext extends State<GlobalKeyContext> {
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
        title: const Text('我的标题1'),
        leading: IconButton(
          icon: const Icon(Icons.dashboard),
          onPressed: () {
            _globalKey.currentState?.openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () => {},
          ),
        ],
      ),
      drawer: Container(
        width: 300,
        color: Colors.pink,
        child: Column(
          children: const [Text('抽屉内区域')],
        ),
      ),
      body: Listener(
        onPointerDown: (e) {
          print('down');
        },
        onPointerUp: (e) {
          print('up');
        },
        onPointerMove: (e) {
          print('move');
        },
        onPointerCancel: (e) {
          print('cancel');
        },
        child: pageList[currentIndex],
      ),
    );
  }
}
