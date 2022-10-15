import 'package:flutter/material.dart';

class MinePage extends StatelessWidget {
  const MinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Mine Page'),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('返回'))
      ],
    );
  }
}
