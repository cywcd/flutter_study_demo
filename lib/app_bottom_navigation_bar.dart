import 'package:flutter/material.dart';

class BottomNavigationBars extends StatefulWidget {
  const BottomNavigationBars({super.key});

  @override
  State<BottomNavigationBars> createState() => _BottomNavigationBarsState();
}

class _BottomNavigationBarsState extends State<BottomNavigationBars> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App BottomNavigationBar'),
      ),
      body: const Text('this is a BottomNavigationBar demo'),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
          BottomNavigationBarItem(
              icon: Icon(Icons.remove_red_eye), label: '发现'),
          BottomNavigationBarItem(icon: Icon(Icons.games), label: '生活'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的'),
        ],
      ),
      // bottomNavigationBar: BottomAppBar(
      //   color: Theme.of(context).primaryColor,
      //   shape: CircularNotchedRectangle(),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       IconButton(onPressed: () {}, icon: Icon(Icons.add)),
      //       IconButton(onPressed: () {}, icon: Icon(Icons.person)),
      //     ],
      //   ),
      // ),
      // floatingActionButtonLocation:
      //     FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.widgets_rounded),
      //   onPressed: () {},
      // ),
    );
  }
}
