import 'dart:developer';

import 'package:dio/dio.dart';

import 'api_service.dart';

class Res<T> {
  bool isSuccessful;
  T res;
  bool hasData;
  Res(this.isSuccessful, this.res, this.hasData);
}

class ModelService<T> {
  late T Function(Response) fromJson;
  late bool Function(T) isSuccessful;
  late bool Function(T) hasData;
  final String endPoint;
  Function(T)? onSuccess;
  Function(T)? onError;

  ModelService(this.endPoint, this.fromJson, this.isSuccessful, this.hasData,
      {this.onSuccess, this.onError});
  Future<Res<T>> getData() async {
    final Response<dynamic> response =
        await RestApiHandlerData.getData(endPoint);
    log(response.toString());
    final T dataClass = fromJson(response);
    if (!response.statusCode.toString().startsWith("20")) {
      if (onError != null) {
        onError!(dataClass);
      }
      return Future.error(Res<T>(false, dataClass, false));
    }
    bool success = isSuccessful(dataClass);
    bool _hasData = false;
    if (success) {
      _hasData = hasData(dataClass);
      if (onSuccess != null) {
        onSuccess!(dataClass);
      }
    }
    return Res<T>(success, dataClass, _hasData);
  }

  Future<Res<T>> postData(dynamic _data) async {
    final Response<dynamic> response =
        await RestApiHandlerData.postData(endPoint, _data);
    final T dataClass = fromJson(response);
    if (!response.statusCode.toString().startsWith("20")) {
      if (onError != null) {
        onError!(dataClass);
      }
      return Future.error(Res<T>(false, dataClass, false));
    }
    bool success = isSuccessful(dataClass);
    bool _hasData = false;
    if (success) {
      _hasData = hasData(dataClass);
      if (onSuccess != null) {
        onSuccess!(dataClass);
      }
    }
    return Res<T>(success, dataClass, _hasData);
  }
}
