import 'package:flutter/material.dart';
import 'package:flutter_demo1/viewmodel/MvvmDemoViewmodal.dart';
import 'package:provider/provider.dart';

class MvvmDemoView extends StatefulWidget {
  const MvvmDemoView({super.key});

  @override
  State<MvvmDemoView> createState() => _MvvmDemoViewState();
}

class _MvvmDemoViewState extends State<MvvmDemoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MVVM 设计模式'),
      ),
      body: ElevatedButton(
        child: const Text('调用viewModal'),
        onPressed: () async {
          context.read<MvvmDemoViewmodel>().get('id');
        },
      ),
    );
  }
}
