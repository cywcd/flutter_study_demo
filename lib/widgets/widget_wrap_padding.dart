import 'package:flutter/material.dart';

class WarpWidget extends StatelessWidget {
  const WarpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Warp'),
      ),
      body: Wrap(
        spacing: 10,
        runSpacing: 10,
        alignment: WrapAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            color: Colors.red,
            child: Padding(
              // padding: EdgeInsets.all(20),
              // padding: EdgeInsets.fromLTRB(10, 20, 30, 15),
              padding: const EdgeInsets.only(top: 40),
              child: Container(
                color: Colors.blue,
              ),
            ),
          ),
          Container(
            width: 200,
            height: 200,
            color: Colors.blue,
          ),
          Container(
            width: 200,
            height: 200,
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }
}
