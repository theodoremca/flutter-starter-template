import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'firestore_service.dart';

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

class FirestoreDatabase<T> {
  final _service = FirestoreService.instance;

  Future<void> setData(
          {required String pathToDocument,
          required Map<String, dynamic> data}) =>
      _service.setData(
        path: pathToDocument,
        data: data,
      );

  Future<String> addData(
          {required String pathToCollection,
          required Map<String, dynamic> data}) =>
      _service.addData(
        path: pathToCollection,
        data: data,
      );
  Future<void> deleteData(
      {required String path, Future<void> Function()? beforeDelete}) async {
    if (beforeDelete != null) {
      await beforeDelete();
    }
    await _service.deleteData(path: path);
  }

  Future<T?> getDoc(
          {required String pathToDocument,
          required T Function(Map<String, dynamic>? data, String documentID)
              modelFromData}) =>
      _service.getDocument(
        path: pathToDocument,
        builder: modelFromData,
      );

  Stream<T?> docStream(
          {required String pathToDocument,
          required T Function(Map<String, dynamic>? data, String documentID)
              modelFromData}) =>
      _service.documentStream(
        path: pathToDocument,
        builder: modelFromData,
      );

  Stream<List<T>> collectionStream(
          {required String pathToCollection,
          required T Function(Map<String, dynamic>? data, String documentID)
              modelFromData}) =>
      _service.collectionStream(
        path: pathToCollection,
        builder: modelFromData,
      );
  Stream<List<T>> collectionStreamWithQuery(
          {required String pathToCollection,
          required T Function(Map<String, dynamic>? data, String documentID)
              modelFromData,
          Query<Map<String, dynamic>>? Function(Query<Map<String, dynamic>>)?
              query}) =>
      _service.collectionStream<T>(
        path: pathToCollection,
        queryBuilder: query,
        builder: modelFromData,
        // sort: (lhs, rhs) => rhs.start.compareTo(lhs.start),
      );

  Future<List<T>> collection(
          {required String pathToCollection,
          required T Function(Map<String, dynamic>? data, String documentID)
              modelFromData,
          Query<Map<String, dynamic>>? Function(Query<Map<String, dynamic>>)?
              query}) =>
      _service.collection<T>(
        path: pathToCollection,
        queryBuilder: query,
        builder: modelFromData,
        // sort: (lhs, rhs) => rhs.start.compareTo(lhs.start),
      );
}
