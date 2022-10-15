// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import 'package:flutter_demo1/model/MvvmDemoModel.dart';
import 'package:http/http.dart';

class MvvmDemoViewmodel extends ChangeNotifier {
  final MvvmDemoModel _model = MvvmDemoModel();

  void get(String id) async {
    final result = _model.get('id');
    print(result);
    print(result.runtimeType);
  }
}
