// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Dialog'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            OutlinedButton(
              onPressed: () {
                _showAlert(context);
              },
              child: const Text('ios 风格alert'),
            ),
            ElevatedButton(
              onPressed: () {
                _SimpleDialog(context);
              },
              child: const Text('内容对话框'),
            )
          ],
        ),
      ),
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('对话框提示'),
          content: const Text('是否确认当前操作'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop('ok');
                  print('ok');
                },
                child: const Text('确定')),
            TextButton(
                onPressed: () {
                  Navigator.pop(context, 'cancel');
                  print('cancel');
                },
                child: const Text('取消')),
          ],
        );
      },
    );
  }

  // ignore: non_constant_identifier_names
  void _SimpleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('对话框提示'),
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: const [
                  Text('是否确认当前操作1'),
                  Text('是否确认当前操作2'),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
