import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'shared_preferences_service.dart';

class RestApiHandlerData {
  static const String _baseUrl = "";
  static final ApiBaseHelper _apiBaseHelper = ApiBaseHelper();

  static FormData _toFromData(Map<String, dynamic> body) {
    return FormData.fromMap(body.map((key, value) => MapEntry(
        key,
        value is List<Uint8List>
            ? filesBytesToFormDataValue(value, "file")
            : value is List<File>
                ? filesToFormDataValue(value, "file")
                : value)));
  }

  static Future<Response<dynamic>> getData(String path) async {
    return await _apiBaseHelper.get('$_baseUrl$path');
  }

  static Future<Response<dynamic>> postData(
      String path, Map<String, dynamic> body,
      {bool asFormData = false}) async {
    final Response<dynamic> response = await _apiBaseHelper.post(
        '$_baseUrl$path', asFormData ? _toFromData(body) : body);
    return response;
  }

  static List<MultipartFile> filesToFormDataValue(
      List<File> files, String name) {
    MultipartFile toMultipartFile(String path) => MultipartFile.fromFileSync(
        path,
        filename:
            '$name-${DateTime.now().millisecondsSinceEpoch.toString()}.jpg');
    return files.map((File file) => toMultipartFile(file.path)).toList();
  }

  static List<MultipartFile> filesBytesToFormDataValue(
      List<Uint8List> files, String name) {
    MultipartFile toMultipartFile(List<int> path) => MultipartFile.fromBytes(
        path,
        filename:
            '$name-${DateTime.now().millisecondsSinceEpoch.toString()}.jpg');
    return files.map((Uint8List file) => toMultipartFile(file)).toList();
  }
}

class ApiBaseHelper {
  final Dio dio = Dio();

  Future<Response<dynamic>> get(String url) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(SharedPreferencesService.tokenKey);
    if (token != null) {
      log(token, name: "token");
      dio.options.headers[HttpHeaders.authorizationHeader] = "Bearer $token";
    }
    return await dio
        .get(url, options: Options(contentType: Headers.jsonContentType))
        .onError((DioError error, stackTrace) => Future.value(error.response));
  }

  Future<dynamic> post(String url, dynamic formData) async {
    log(url, name: "request endpoint");
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(SharedPreferencesService.tokenKey);
    if (token != null) {
      log(token, name: "token");
      dio.options.headers[HttpHeaders.authorizationHeader] = "Bearer $token";
    }
    log("post", name: "request type");
    return await dio
        .post(url, data: formData)
        .onError((DioError error, stackTrace) {
      log(error.response.toString(), name: 'post Error');
      return Future.value(error.response);
    });
  }
}

class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}
