import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'loading.dart';

class CustomAsyncValue<T> extends StatelessWidget {
  const CustomAsyncValue({
    Key? key,
    required this.streamAsyncValue,
    required this.data,
    this.color,
    this.loading,
    this.onError,
  }) : super(key: key);

  final AsyncValue<T> streamAsyncValue;
  final Color? color;
  final Widget Function(T) data;
  final Widget Function(T)? onError;
  final Widget? loading;

  @override
  Widget build(BuildContext context) {
    return streamAsyncValue.when(
        data: data,
        error: (e, s) {
          log(e.toString(), name: "Async Error");
          log(s.toString(), name: "Async Error Location");
          if (onError != null) return onError!(e as T);
          return const Center(child: Text('Uh oh. Something went wrong'));
        },
        loading: () =>
            loading ?? Center(child: AppLoadingIndication(color: color)));
  }
}

class WhenDataWidget<T> extends StatelessWidget {
  const WhenDataWidget({
    Key? key,
    required this.streamAsyncValue,
    required this.data,
    this.color,
    this.loading,
    this.onError,
  }) : super(key: key);

  final AsyncValue<T> streamAsyncValue;
  final Color? color;
  final Widget Function(T) data;
  final Widget Function(T)? onError;
  final Widget? loading;

  @override
  Widget build(BuildContext context) {
    return streamAsyncValue.whenData((value) {
          return data(value);
        }).value ??
        const SizedBox();
  }
}
