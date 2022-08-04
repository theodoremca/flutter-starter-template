import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'model_service.dart';

const iniList = [];

class Pagination<L, T> {
  final List<L>? list;
  final int page;
  final String errorMessage;
  final bool isFetching;
  Pagination({
    this.list,
    this.isFetching = false,
    this.page = 1,
    this.errorMessage = '',
  });

  Pagination.initial()
      : list = <L>[],
        page = 1,
        errorMessage = '',
        isFetching = false;

  bool get refreshError => errorMessage != '' && (list?.length ?? 0) <= 20;

  Pagination<L, T> copyWith({
    List<L>? list,
    int? page,
    bool? isFetching,
    String? errorMessage,
  }) {
    return Pagination(
      list: list ?? this.list,
      page: page ?? this.page,
      isFetching: isFetching ?? this.isFetching,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  String toString() =>
      '$T Pagination(movies: $list, page: $page, errorMessage: $errorMessage)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Pagination &&
        listEquals(o.list, list) &&
        o.page == page &&
        o.errorMessage == errorMessage;
  }

  @override
  int get hashCode => list.hashCode ^ page.hashCode ^ errorMessage.hashCode;
}

class PaginationController<L, T> extends StateNotifier<Pagination<L, T>> {
  final Future<Res<T>> Function([int page]) service;
  final List<L>? Function(T) getList;
  PaginationController(
    this.service,
    this.getList, [
    Pagination<L, T>? state,
  ]) : super(state ?? Pagination<L, T>()) {
    getPaginatedList();
  }
  int lastPage = 1;
  Future<void> getPaginatedList() async {
    log("gettiing", name: "item");
    log("${state.page}", name: "page");
    await Future.delayed(Duration(milliseconds: 1));
    state = state.copyWith(isFetching: true);
    try {
      final result = await service(state.page);
      final List<L> list = getList(result.res) ?? <L>[];
      state = state.copyWith(
          list: [...(state.list ?? <L>[]), ...list],
          page: state.page + 1,
          isFetching: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isFetching: false);
    } finally {}
  }

  void handleScrollWithIndex(int index) {
    if (lastPage == state.page) return;
    final itemPosition = index + 1;
    final requestMoreData = itemPosition % 20 == 0 && itemPosition != 0;
    final pageToRequest = itemPosition ~/ 20;
    if (requestMoreData && pageToRequest + 1 >= state.page) {
      lastPage = state.page;
      getPaginatedList();
    }
  }
}
