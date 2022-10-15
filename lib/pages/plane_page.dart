// ignore: file_names
import 'package:flutter/material.dart';

class PlanePage extends StatelessWidget {
  const PlanePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Plane Page'),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('返回'))
      ],
    );
  }
}
