import 'package:flutter/material.dart';

class WidgetPositioned extends StatelessWidget {
  const WidgetPositioned({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Positioned'),
      ),
      body: SizedBox(
        width: 400,
        height: 800,
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Positioned(
              top: 30,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            ),
            Positioned(
              right: 15,
              top: 30,
              child: Container(
                width: 150,
                height: 150,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
