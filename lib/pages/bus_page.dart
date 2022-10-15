import 'package:flutter/material.dart';

class BusPage extends StatefulWidget {
  const BusPage({super.key});

  @override
  State<BusPage> createState() => _BusPageState();
}

class _BusPageState extends State<BusPage> with SingleTickerProviderStateMixin {
  final List _tabs = ['金杯', '奔驰', '丰田'];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.lightGreen,
          child: TabBar(
            controller: _tabController,
            tabs: _tabs.map((e) => Tab(text: e)).toList(),
          ),
        ),
        SizedBox(
          height: 400,
          child: TabBarView(
            controller: _tabController,
            children: _tabs
                .map((e) => Column(
                      children: [
                        Text(e + '的内容'),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('返回'))
                      ],
                    ))
                .toList(),
          ),
        )
      ],
    );
  }
}
