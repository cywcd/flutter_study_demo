import 'package:flutter/material.dart';
import 'package:flutter_demo1/app_scaffold.dart';
import 'package:flutter_demo1/app_bottom_navigation_bar.dart';
import 'package:flutter_demo1/app_tabbar.dart';
import 'package:flutter_demo1/dio_data_view.dart';
import 'package:flutter_demo1/future_delayed.dart';
import 'package:flutter_demo1/gestures.dart';
import 'package:flutter_demo1/global_key.dart';
import 'package:flutter_demo1/http_dio.dart';
import 'package:flutter_demo1/get_battery.dart';
import 'package:flutter_demo1/page_params.dart';
import 'package:flutter_demo1/plugin/plugin_left_scroll_delete.dart';
import 'package:flutter_demo1/plugin/plugin_sharedPreferences.dart';
import 'package:flutter_demo1/plugin/plugin_webview_flutter.dart';
import 'package:flutter_demo1/route_params.dart';
import 'package:flutter_demo1/widgets/widget_positioned.dart';
import 'package:flutter_demo1/widgets/widget_wrap_padding.dart';
import 'package:flutter_demo1/route_navigator.dart';
import 'package:flutter_demo1/widgets/widget_decoratedbox.dart';
import 'package:flutter_demo1/widgets/widget_transform.dart';
import 'package:flutter_demo1/widgets/widget_dialog.dart';
import 'package:flutter_demo1/widgets/widget_drawer.dart';
import 'package:flutter_demo1/widgets/widget_gridview.dart';
import 'package:flutter_demo1/widgets/widget_scrollbar.dart';
import 'package:flutter_demo1/widgets/widget_sizebox.dart';
import 'package:flutter_demo1/pages/home_page.dart';
import 'package:flutter_demo1/widgets/widget_listtile.dart';
import 'package:flutter_demo1/widgets/wdiget_container.dart';
import 'package:flutter_demo1/widgets/widget_card.dart';
import 'package:flutter_demo1/widgets/widget_flex.dart';
import 'package:flutter_demo1/widgets/widget_form.dart';
import 'package:flutter_demo1/widgets/widget_layout.dart';
import 'package:flutter_demo1/widgets/widget_listview.dart';
import 'package:flutter_demo1/widgets/widget_table.dart';

Map<String, WidgetBuilder> routes = {
  '/': (context) => const HomePage(),
  'card': (context) => const CardWidget(),
  'form': (context) => const FormWidget(),
  'container': (context) => const WidgetContainer(),
  'flex': (context) => const WidgetFlex(),
  'layout': (context) => const LayoutWidget(),
  'listView': (context) => const WidgetListView(),
  'listTitle': (context) => const ListTileWidget(),
  'sizeBox': (context) => const SizedBoxWidget(),
  'table': (context) => const TableWidget(),
  'gridView': (context) => const GridViewWidget(),
  'dialog': (context) => const DialogWidget(),
  'drawer': (context) => const DrawerWidget(),
  'scrollbar': (context) => const ScrollBarWidget(),
  'navigator': (context) => const RoutePage(),
  'scaffold': (context) => const ScaffoldWidget(),
  'bottomNavigationBar': (context) => const BottomNavigationBars(),
  'futureDelayed': (context) => const FutureDelayed(),
  'transformDemo': (context) => const TransformDemo(),
  'wrap': (context) => const WarpWidget(),
  'tabbar': (context) => const TabBarWidget(),
  'decoratedbox': (context) => const DecoratedBoxWidget(),
  'gestures': (context) => const GesturesWidget(),
  'sharedPreferences': (context) => const SharedPreferencesDemo(),
  'leftScrollDelete': (context) => const LeftScrollDeletePlug(),
  'httpDio': (context) => const DioDemoPage(),
  'positioned': (context) => const WidgetPositioned(),
  'dioDataView': (context) => const DioDataView(),
  'routeParams': (context) => const RouteParamsPage(),
  'routeParamsSecond': (context) => const RouteParamsSecondPage(),
  'globalKey': (context) => const GlobalKeyContext(),
  'pageParam': (context) => PageParams(),
  'battery': (context) => const GetBatteryDemo(),
  'webView': (context) => const WebViewExample(),
};
