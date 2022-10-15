// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GetBatteryDemo extends StatefulWidget {
  const GetBatteryDemo({super.key});

  @override
  State<GetBatteryDemo> createState() => _GetBatteryDemoState();
}

class _GetBatteryDemoState extends State<GetBatteryDemo> {
  static const String CHINA_NAME = 'flutter.service/call_native';
  static const Platform = MethodChannel(CHINA_NAME);
  static String _result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('flutter native 交互'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () async {
                String result =
                    await Platform.invokeMethod('call_native_method');
                setState(() {
                  _result = result;
                });
              },
              child: const Text('调用native接口')),
          Text('result is:$_result'),
        ],
      ),
    );
  }
}

class BatteryRoute extends StatefulWidget {
  const BatteryRoute({super.key});

  @override
  State<StatefulWidget> createState() {
    return BatteryRouteState();
  }
}

class BatteryRouteState extends State<BatteryRoute> {
  String _batteryLevel = 'Unknown battery level.';
  // 3.异步获取到电量，然后重新渲染页面
  getBatteryLevel() async {
    _batteryLevel = await BatteryChannel.getBatteryLevel();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    BatteryChannel.initChannels(); // 1\. 初始化通道
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BatteryRoute"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: const Text('Get Battery Level'),
              onPressed: () {
                getBatteryLevel(); // 2\. 调用通道方法
              },
            ),
            Text(_batteryLevel),
          ],
        ),
      ),
    );
  }
}

class BatteryChannel {
  static const _batteryChannelName = "cn.blogss/battery"; // 1.方法通道名称
  static MethodChannel _batteryChannel =
      const MethodChannel(_batteryChannelName);

  static void initChannels() {
    _batteryChannel = const MethodChannel(_batteryChannelName); // 2\. 实例化一个方法通道
  }

  // 3\. 异步任务，通过平台通道与特定平台进行通信，获取电量，这里的宿主平台是 Android
  static getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await _batteryChannel.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    return batteryLevel;
  }
}
