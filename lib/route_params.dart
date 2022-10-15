// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class RouteParamsPage extends StatefulWidget {
  const RouteParamsPage({super.key});

  @override
  State<RouteParamsPage> createState() => _RouteParamsPageState();
}

class _RouteParamsPageState extends State<RouteParamsPage> {
  dynamic backParams;

  @override
  void initState() {
    super.initState();
    backParams = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('routeParams 第一个页面'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              Navigator.of(context)
                  .pushNamed('routeParamsSecond', arguments: 'helllo')
                  .then((value) => {
                        setState(() {
                          backParams = value;
                        }),
                        print('返回时传值：$value')
                      });
              // var result = await Navigator.push(
              //     context,
              //     new MaterialPageRoute(
              //       builder: (context) => new SecondPage(),
              //       settings: RouteSettings(
              //         name: '(我是页面一传过来的值)',
              //         arguments: '121212s',
              //       ),
              //       maintainState: false,
              //       fullscreenDialog: false,
              //     ));
            },
            child: Text('跳转到第二个页面:$backParams'),
          )
        ],
      ),
    );
  }
}

class RouteParamsSecondPage extends StatelessWidget {
  const RouteParamsSecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic arguments = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('第二个页面接收：$arguments'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop({"name": "我是回传"});
            },
            child: const Text('返回第一个页面'),
          ),
        ],
      ),
    );
  }
}
