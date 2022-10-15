// ignore_for_file: avoid_print, sort_child_properties_last

import 'package:flutter/material.dart';

class ScrollBarWidget extends StatefulWidget {
  const ScrollBarWidget({super.key});

  @override
  State<ScrollBarWidget> createState() => _ScrollBarWidgetState();
}

class _ScrollBarWidgetState extends State<ScrollBarWidget> {
  final List<int> _listData = [];
  late ScrollController _scrollController;
  bool btnShow = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      print(_scrollController);
      if (_scrollController.offset >= 100 && btnShow == false) {
        setState(() {
          btnShow = true;
        });
      } else if (_scrollController.offset < 100 && btnShow == true) {
        setState(() {
          btnShow = false;
        });
      }
    });
    for (var i = 0; i < 100; i++) {
      _listData.add(i);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget ScrollBar'),
      ),
      body: Scrollbar(
        child: RefreshIndicator(
          child: ListView.builder(
            controller: _scrollController,
            itemBuilder: (BuildContext context, int index) {
              return Text(_listData[index].toString());
            },
            itemCount: _listData.length,
          ),
          onRefresh: _onRefresh,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
          BottomNavigationBarItem(
              icon: Icon(Icons.remove_red_eye), label: '发现'),
          BottomNavigationBarItem(icon: Icon(Icons.games), label: '生活'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的'),
        ],
      ),
      floatingActionButton: btnShow
          ? FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                _scrollController.animateTo(
                    _scrollController.position.maxScrollExtent,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease);
              },
            )
          : null,
      // bottomNavigationBar: BottomAppBar(
      //   color: Theme.of(context).primaryColor,
      //   shape: CircularNotchedRectangle(),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       IconButton(onPressed: () {}, icon: Icon(Icons.add)),
      //       IconButton(onPressed: () {}, icon: Icon(Icons.person)),
      //     ],
      //   ),
      // ),
      // floatingActionButtonLocation:
      //     FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.widgets_rounded),
      //   onPressed: () {},
      // ),
    );
  }

  Future _onRefresh() async {
    await Future.delayed(const Duration(seconds: 3), () {
      print('refresh');
    });
  }
}
