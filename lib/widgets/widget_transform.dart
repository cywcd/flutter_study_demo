import 'package:flutter/material.dart';

class TransformDemo extends StatelessWidget {
  const TransformDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Transform'),
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
            color: Colors.red,
            child: Transform(
              transform: Matrix4.skewY(0.5),
              child: Container(
                color: Colors.blue,
                child: const Text('Skewy'),
              ),
            ),
          ),
          Container(
            color: Colors.red,
            child: Transform(
              transform: Matrix4.skewX(0.5),
              child: Container(
                color: Colors.blue,
                child: const Text('SkewX'),
              ),
            ),
          ),
          Container(
            color: Colors.red,
            child: Transform.scale(
              scale: 4,
              child: Container(
                color: Colors.blue,
                child: const Text('SkewX'),
              ),
            ),
          ),
          Container(
            width: 300,
            height: 300,
            color: Colors.red,
            child: Transform.translate(
              offset: const Offset(100, 50),
              child: Container(
                color: Colors.blue,
                child: const Text('SkewX'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
