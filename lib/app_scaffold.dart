import 'package:flutter/material.dart';
import 'pages/bus_page.dart';
import 'pages/plane_page.dart';
import 'pages/mine_page.dart';

class ScaffoldWidget extends StatefulWidget {
  const ScaffoldWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ScaffoldWidget();
  }
}

class _ScaffoldWidget extends State<ScaffoldWidget> {
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
        title: const Text('脚手架 Scaffold'),
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
      body: pageList[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.airport_shuttle), label: 'bus'),
          BottomNavigationBarItem(
              icon: Icon(Icons.airplanemode_active), label: 'plane'),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment_ind), label: 'mine'),
        ],
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
