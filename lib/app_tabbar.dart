import 'package:flutter/material.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({super.key});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget>
    with SingleTickerProviderStateMixin {
  List<Widget> viewWidgets = [
    const FlutterView(),
    const AndroidView(),
    const IOSView()
  ];
  final List _tabs = ['flutter', 'android', 'ios'];
  late TabController _tabBarController;

  @override
  void initState() {
    _tabBarController = TabController(length: _tabs.length, vsync: this);
    _tabBarController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Icon(Icons.mail_lock),
          Icon(Icons.arrow_forward),
        ],
        title: const Text('Widget TabBar'),
        elevation: 4.0,
        centerTitle: true,
        bottom: TabBar(
          labelColor: Colors.yellowAccent,
          controller: _tabBarController,
          tabs: _tabs.map((e) => Tab(text: e)).toList(),
        ),
      ),
      // body: SizedBox(
      //   width: 400,
      //   height: 200,
      //   child: Container(
      //     color: Colors.red,
      //   ),
      // ),
      body: TabBarView(
        controller: _tabBarController, // 此处controller 需要与导航TabBar使用同一个
        children: viewWidgets,
      ),
    );
  }
}

class FlutterView extends StatelessWidget {
  const FlutterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Flutter');
  }
}

class AndroidView extends StatelessWidget {
  const AndroidView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Android');
  }
}

class IOSView extends StatelessWidget {
  const IOSView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('IOS');
  }
}
