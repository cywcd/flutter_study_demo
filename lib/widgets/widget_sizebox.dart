import 'package:flutter/material.dart';

class SizedBoxWidget extends StatelessWidget {
  const SizedBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SizedBox Widget'),
      ),
      body: Column(
        children: [
          SizedBox(
            width: 400,
            height: 200,
            child: Container(
              color: Colors.red,
            ),
          ),
          ConstrainedBox(
            // constraints: BoxConstraints.expand(), // 填满剩余空间
            constraints: const BoxConstraints(
              minWidth: double.infinity,
              minHeight: 200,
              maxHeight: 300,
            ),
            child: Container(
              width: 100, // 宽度被外层限制
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
