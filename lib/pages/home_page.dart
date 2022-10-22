import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Study demo'),
      ),
      body: Container(
        padding: const EdgeInsets.all(0),
        child: _buildList(),
      ),
    );
  }

  Widget _buildList() {
    return ListView(
      children: [
        _tile('Widget Card', 'widget Card example', Icons.list, 'card'),
        _tile('Widget Form', 'widget Form example', Icons.list, 'form'),
        _tile('Widget Container', 'widget Container example', Icons.list,
            'container'),
        _tile('Widget Flex', 'widget Flex example', Icons.list, 'flex'),
        _tile('Widget layout', 'widget layout example', Icons.list, 'layout'),
        _tile('Widget Positioned', 'widget Positioned example', Icons.list,
            'positioned'),
        _tile('Widget ListView', 'widget ListView example', Icons.list,
            'listView'),
        _tile('Widget ListTitle', 'widget ListTitle example', Icons.list,
            'listTitle'),
        _tile(
            'Widget SizeBox', 'widget SizeBox example', Icons.list, 'sizeBox'),
        _tile('Widget Table && DataTable', 'widget Table && DataTable example',
            Icons.list, 'table'),
        _tile('Widget GridView', 'widget GridView example', Icons.list,
            'gridView'),
        _tile('Widget Dialog', 'widget Dialog example', Icons.list, 'dialog'),
        _tile('Widget ScrollBar', 'widget ScrollBar example', Icons.list,
            'navigator'),
        _tile('Widget Warp', 'widget Warp example', Icons.list, 'wrap'),
        _tile('Widget Transform', 'widget Transform example', Icons.list,
            'transformDemo'),
        _tile('Widget DecoratedBox', 'widget DecoratedBox example', Icons.list,
            'decoratedbox'),
        const Divider(),
        _tile('App Scaffold', 'scaffold (Tabs && Drawer) example', Icons.list,
            'scaffold'),
        _tile(
            'App BottomNavigationBar',
            'scaffold (BottomNavigationBar) example',
            Icons.list,
            'bottomNavigationBar'),
        _tile('App TabBar', 'scaffold (TabBar) example', Icons.list, 'tabbar'),
        const Divider(),
        _tile('Route Navigator', 'route Navigator example', Icons.list,
            'navigator'),
        _tile('Future delayed', 'Future delayed example', Icons.list,
            'futureDelayed'),
        _tile('GestureDetector', 'GestureDetector example', Icons.list,
            'gestures'),
        _tile('Dio', 'Dio http request example', Icons.list, 'httpDio'),
        const Divider(),
        _tile('Dio data', 'Dio http data view example', Icons.list,
            'dioDataView'),
        _tile(
            'Route params', 'Route params example', Icons.list, 'routeParams'),
        _tile('GlobalKey', 'GlobalKey example', Icons.list, 'globalKey'),
        _tile('Page Params', 'page params example', Icons.list, 'pageParam'),
        const Divider(),
        _tile('Page Battery', 'page Battery example', Icons.list, 'battery'),
        const Divider(),
        _tile('Plugin SharedPreferences', 'Plugin SharedPreferences example',
            Icons.list, 'sharedPreferences'),
        _tile(
            'Plugin left_scroll_actions',
            'Plugin left_scroll_actions example',
            Icons.list,
            'leftScrollDelete'),
        _tile('Plugin webview_flutter', 'Plugin webview_flutter example',
            Icons.list, 'webView'),
      ],
    );
  }

  ListTile _tile(String title, String subtitle, IconData icon, routename) {
    return ListTile(
      title: Text(title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          )),
      subtitle: Text(subtitle),
      leading: Icon(
        icon,
        color: Colors.blue[500],
      ),
      onTap: () => {Navigator.of(context).pushNamed(routename)},
    );
  }
}
