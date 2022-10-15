import 'package:flutter/material.dart';

class WidgetFlex extends StatelessWidget {
  const WidgetFlex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Flex'),
      ),
      body: Flex(
        crossAxisAlignment: CrossAxisAlignment.start,
        direction: Axis.vertical,
        children: [
          Expanded(
              flex: 2,
              child: Container(
                color: Colors.red,
              )),
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.yellow,
              )),
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.blue,
              )),
          Expanded(
              flex: 1,
              child: Container(
                height: 200,
                color: Colors.black,
              )),
        ],
      ),
    );
  }
}
