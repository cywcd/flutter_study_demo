import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({super.key});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  final List<Map> _list = [];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 10; i++) {
      _list.add({
        'name': 'wang$i',
        'age': 10 + i,
      });
    }
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return Card(
      color: Colors.lightBlueAccent,
      shadowColor: Colors.green,
      elevation: 5.0,
      child: Column(
        children: [
          const SizedBox(height: 8),
          Text(
            _list[index]['name'],
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(_list[index]['age'].toString(),
              style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Card'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemBuilder: _itemBuilder,
          itemCount: _list.length,
        ),
      ),
    );
  }
}
