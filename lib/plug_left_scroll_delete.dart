// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:left_scroll_actions/left_scroll_actions.dart';

class LeftScrollDeletePlug extends StatefulWidget {
  const LeftScrollDeletePlug({super.key});

  @override
  State<LeftScrollDeletePlug> createState() => _LeftScrollDeletePlugState();
}

class _LeftScrollDeletePlugState extends State<LeftScrollDeletePlug> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('left_scroll_actions 左滑删除插件'),
      ),
      body: Container(
        margin: const EdgeInsets.all(0),
        child: CupertinoLeftScroll(
          // important, each Row must have different key.
          // DO NOT use '$index' as Key! Use id or title.
          key: const Key('TODO: your key'),
          // left scroll widget will auto close while the other widget is opened and has same closeTag.
          // 当另一个有相同closeTag的组件打开时，其他有着相同closeTag的组件会自动关闭.
          closeTag: const LeftScrollCloseTag('TODO: your tag'),
          buttonWidth: 80,
          buttons: <Widget>[
            LeftScrollItem(
              text: 'edit',
              color: Colors.orange,
              onTap: () {
                print('edit');
              },
            ),
            LeftScrollItem(
              text: 'delete',
              color: Colors.red,
              onTap: () {
                print('delete');
              },
            ),
          ],
          onTap: () {
            print('tap row');
          },
          child: Container(
            height: 60,
            color: Colors.white,
            alignment: Alignment.center,
            child: const Text('👈 Try Scroll Left'),
          ),
        ),
      ),
    );
  }
}
