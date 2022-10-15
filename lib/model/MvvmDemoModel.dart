// ignore_for_file: file_names

import 'package:dio/dio.dart';

/*
  获取信息方法
 */
class MvvmDemoModel {
  dynamic get(String id) async {
    return await Dio().get(
        'https://www.fastmock.site/mock/b55ebcfe7e6f6de09f33b493894dc724/study/server/v1.0/list');
  }
}
