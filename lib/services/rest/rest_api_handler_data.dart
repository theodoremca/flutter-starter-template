import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'api_helpers/api_base_helper.dart';

class RestApiHandlerData {
  static String _baseUrl = "https://vericheck.gq/api/";
  static ApiBaseHelper _apiBaseHelper = ApiBaseHelper();

  static getData(String path) async {
    // container.read(apiStateProvider.notifier).update(requesting: true);
    final response = await _apiBaseHelper.get('$_baseUrl$path');
    // print(response);
    // container.read(apiStateProvider.notifier).update(requesting: false);
    return response;
  }

  static postData(String path, FormData body) async {
    print('$_baseUrl$path');
    print(body);
    final response = await _apiBaseHelper.post('$_baseUrl$path', body);
    return response;
  }

  static List<MultipartFile> fileToFormDataValue(
      List<File> files, String name) {
    MultipartFile toMultipartFile(String path) =>
        MultipartFile.fromFileSync(path,
            filename: name +
                "-" +
                DateTime.now().millisecondsSinceEpoch.toString() +
                '.jpg');
    return files.map((File file) => toMultipartFile(file.path)).toList();
  }
}
