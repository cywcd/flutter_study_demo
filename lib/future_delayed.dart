// 异步处理
// ignore_for_file: avoid_print, must_be_immutable

import 'package:flutter/material.dart';

class FutureDelayed extends StatefulWidget {
  const FutureDelayed({super.key});

  @override
  State<FutureDelayed> createState() => _FutureDelayedState();
}

class _FutureDelayedState extends State<FutureDelayed> {
  final str = """
          void delayedFn() {
            Future.delayed(const Duration(seconds: 5), () {
              print('ok');
            });
            print('play game');

            Future.wait([
              Future.delayed(const Duration(seconds: 1), () {
                print('001');
              }),
              Future.delayed(const Duration(seconds: 3), () {
                print('002');
              }),
              Future.delayed(const Duration(seconds: 2), () {
                print('003');
              }),
            ]).then((value) {
              print('all results end');
            });
          }
    """;

  @override
  void initState() {
    super.initState();
    delayedFn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('异步 Future(delayed)'),
      ),
      body: Column(
        children: [
          Text(str),
        ],
      ),
    );
  }

  void delayedFn() {
    Future.delayed(const Duration(seconds: 5), () {
      print('ok');
    });
    print('play game');

    Future.wait([
      Future.delayed(const Duration(seconds: 1), () {
        print('001');
      }),
      Future.delayed(const Duration(seconds: 3), () {
        print('002');
      }),
      Future.delayed(const Duration(seconds: 2), () {
        print('003');
      }),
    ]).then((value) {
      print('all results end');
    });
  }
}
