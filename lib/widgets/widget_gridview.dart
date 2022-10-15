import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget GridView'),
      ),
      // body: Scrollbar(
      //   child: SingleChildScrollView(
      //     child: Container(
      //       height: 3000,
      //       color: Colors.red,
      //     ),
      //   ),
      // ),
      body: Column(
        children: [
          const ListTile(
            title: Text('固定表头'),
          ),
          // Container(
          //   padding: EdgeInsets.all(10),
          //   height: 400,
          //   child: ListView.builder(
          //       itemCount: 50,
          //       itemExtent: 30,
          //       itemBuilder: (BuildContext context, int index) {
          //         return Text('列表内容' + index.toString());
          //       }),
          // ),
          Container(
            padding: const EdgeInsets.all(10),
            height: 400,
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1,
              ),
              children: const [
                Text('1'),
                Text('2'),
                Text('3'),
                Text('4'),
                Text('5'),
                Text('6'),
                Text('7'),
                Text('8'),
                Text('9'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
