import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import 'api_exception.dart';

final Dio dio = Dio();

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body.toString());
      return responseJson;
    case 400:
      return json.decode(response.body.toString());
    case 401:
    case 403:
      return json.decode(response.body.toString());
    case 500:
    default:
      return FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}

dynamic _returnDuoResponse(Response<dynamic> response) {
  print("${response.statusMessage}");
  switch (response.statusCode) {
    case 200:
      dynamic responseJson = response.data;
      return responseJson;
    case 400:
      dynamic responseJson = response.data;
      return responseJson;
    case 401:
    case 403:
      dynamic responseJson = response.data;
      return responseJson;
    case 500:
    default:
      return FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}

class ApiBaseHelper {
  Future<dynamic> delete(String url) async {
    var apiResponse;
    try {
      final response = await http.delete(Uri.parse(url));
      apiResponse = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return apiResponse;
  }

  Future<dynamic> get(String url) async {
    print(url);
    var responseJson;
    try {
      final response = await dio.get(url);
      responseJson = _returnDuoResponse(response);
    } catch(e) {
      print(e);
    }
    return responseJson;
  }

  Future<dynamic> get1(String url) async {
    print(url);
    var responseJson;
    try {
      final response = await http.get(Uri.parse(url));
      responseJson = _returnResponse(response);
    } catch(e) {
      print(e);
    }
    return responseJson;
  }

  Future<dynamic> post(String url, FormData formData) async {
    var responseJson;
    try {
      final response = await dio.post(url, data: formData);
      responseJson = _returnDuoResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post1(String url, dynamic body) async {
    var responseJson;
    try {
      final response = await http.post(Uri.parse(url), body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }

  Future<dynamic> put(String url, dynamic body) async {
    var responseJson;
    try {
      final response = await http.put(Uri.parse(url), body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }
}
